require! {
  react: {create-element}
  redux: {create-store, apply-middleware}
  \react-redux : {Provider}
  \react-dom : {render}
  \redux-thunk : thunk-middleware
  \./components/Emo.ls
  \./reducers.ls
}

render do
  create-element do
    Provider
    store: apply-middleware thunk-middleware |> (.call @, create-store) |> (.call @, reducers)
    create-element Emo
  document.get-element-by-id \Emo
