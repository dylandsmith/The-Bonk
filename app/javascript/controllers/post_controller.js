import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  newPost(event) {
    // console.log(event.params)
    let txt = ""
    let bookendDiv1, bookendDiv2

    // need different divs to attach to when it is a reply
    if(event.params["commentType"] == "submit") {
      bookendDiv1 = document.getElementById("comments-container")
      bookendDiv2 = document.getElementById("comments-field")
    }
    else {
      bookendDiv1 = document.getElementById("comments-container")
      bookendDiv2 = document.getElementById("comment_" + event.params["postId"]).nextElementSibling
    }
    
    const btn = document.getElementById("add-comments-btn")

    const div1 = document.createElement("div")
    if(event.params["commentType"] == "submit")
      div1.setAttribute("class", "comment-container")
    else
      div1.setAttribute("class", "reply-container")

    const div2 = document.createElement("div")
    div2.setAttribute("class", "comment-header")

    const titleDiv = document.createElement("div")
    titleDiv.setAttribute("class", "comment-title")

    const titleInput = document.createElement("input")
    titleInput.setAttribute("id", "comment_title")
    titleInput.setAttribute("class", "comment-title-input")
    titleInput.setAttribute("placeholder", "Comment Title")
    titleDiv.appendChild(titleInput)

    const divSave = document.createElement("div")
    divSave.setAttribute("class", "comment-save")

    const divIcon = document.createElement("i")
    divIcon.setAttribute("class", "fa fa-comment")

    divSave.appendChild(divIcon)

    const commentBodyDiv = document.createElement("div")
    commentBodyDiv.setAttribute("class", "comment")

    const bodyTextArea = document.createElement("textarea")
    bodyTextArea.setAttribute("id", "comment_body")
    bodyTextArea.setAttribute("placeholder", "Comment body here...")
    bodyTextArea.setAttribute("class", "comment-body")

    commentBodyDiv.appendChild(bodyTextArea)

    const saveCommentDiv = document.createElement("div")
    saveCommentDiv.setAttribute("data-controller", "submit_movie_post")
    if(event.params["commentType"] == "reply")
      saveCommentDiv.setAttribute("data-action", "click->submit_movie_post#submitReply")
    else
      saveCommentDiv.setAttribute("data-action", "click->submit_movie_post#submitPost")

    if(event.params["commentType"] == "reply")
      saveCommentDiv.setAttribute("data-submit_movie_post-tester-param", event.params["postId"])
    saveCommentDiv.setAttribute("class", "comment-save-btn")
    // saveCommentDiv.setAttribute("data-submit-movie-post-target", "source")
    if(event.params["commentType"] == "submit")
      txt = document.createTextNode("Submit Comment")
    else
      txt = document.createTextNode("Submit Reply")
    saveCommentDiv.appendChild(txt)

    div2.appendChild(titleDiv)
    div2.appendChild(divSave)
    div1.appendChild(div2)
    div1.appendChild(commentBodyDiv)
    div1.appendChild(saveCommentDiv)

    if(event.params["commentType"] == "submit") {
      bookendDiv1.setAttribute("data-controller", "post")
      bookendDiv1.insertBefore(div1, bookendDiv2)
    }
    else {
      bookendDiv1.setAttribute("data-controller", "post")
      bookendDiv1.insertBefore(div1, bookendDiv2)
    }

    btn.setAttribute("class", "remove-btn")
  }
}
