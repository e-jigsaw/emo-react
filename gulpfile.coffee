gulp = require 'gulp'
jade = require 'gulp-jade'
styl = require 'gulp-stylus'
conn = require 'gulp-connect'
deploy = require 'gulp-gh-pages'
browserify = require 'browserify'
coffeeify = require 'coffeeify'
source = require 'vinyl-source-stream'
buffer = require 'vinyl-buffer'
gulpif = require 'gulp-if'
uglify = require 'gulp-uglify'

paths =
  jade: 'src/*.jade'
  styl: 'src/*.styl'
  coffee: 'src/*.coffee'
  dest: 'build/'

gulp.task 'jade', ->
  gulp.src paths.jade
    .pipe jade()
    .pipe gulp.dest(paths.dest)

gulp.task 'styl', ->
  gulp.src paths.styl
    .pipe styl()
    .pipe gulp.dest(paths.dest)

gulp.task 'browserify', ->
  browserify
    entries: ['./src/index.coffee']
    extensions: ['.coffee']
  .bundle()
  .pipe source 'index.js'
  .pipe gulpif(process.env.CI is 'true', buffer())
  .pipe gulpif(process.env.CI is 'true', uglify())
  .pipe gulp.dest paths.dest

gulp.task 'default', ['jade', 'styl', 'browserify']
gulp.task 'watch', ['default'], ->
  gulp.watch paths.jade, ['jade']
  gulp.watch paths.styl, ['styl']
  gulp.watch paths.coffee, ['browserify']
  conn.server
    root: 'build'

gulp.task 'deploy', ->
  gulp.src './build/*'
    .pipe deploy
      cacheDir: 'tmp'
