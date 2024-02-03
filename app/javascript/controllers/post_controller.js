import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  newPost(event) {
    

    if(event.params["commentType"] == "submit") {
      this.submitComment(event)
    }
    else {
      this.submitReply(event)
    }

    // let txt = ""
    // let bookendDiv1, bookendDiv2

    // // need different divs to attach to when it is a reply
    // if(event.params["commentType"] == "submit") {
    //   bookendDiv1 = document.getElementById("comments-container")
    //   bookendDiv2 = document.getElementById("comments-field")
    // }
    // else {
    //   bookendDiv1 = document.getElementById("comments-container")
    //   bookendDiv2 = document.getElementById("comment_" + event.params["postId"]).nextElementSibling
    // }
    
    // const btn = document.getElementById("add-comments-btn")

    // const div1 = document.createElement("div")
    // if(event.params["commentType"] == "submit")
    //   div1.setAttribute("class", "comment-container")
    // else
    //   div1.setAttribute("class", "reply-container")

    // const div2 = document.createElement("div")
    // if(event.params["commentType"] == "submit")
    //   div2.setAttribute("class", "comment-header")
    // else
    //   div2.setAttribute("class", "reply-header")

    // const titleDiv = document.createElement("div")
    // // if it is a reply, use comment-title-postId -> like: comment-title-2
    // if(event.params["commentType"] == "submit")
    //   titleDiv.setAttribute("class", "comment-title")
    // else
    //   titleDiv.setAttribute("class", "reply-title")

    // const titleInput = document.createElement("input")
    // if(event.params["commentType"] == "submit") {
    //   titleInput.setAttribute("id", "comment-title")
    //   titleInput.setAttribute("class", "comment-title-input")
    // }
    // else {
    //   titleInput.setAttribute("id", "reply-title-" + event.params["postId"])
    //   titleInput.setAttribute("class", "reply-title-input")
    // }
  
    // titleInput.setAttribute("placeholder", "Comment Title")
    // titleDiv.appendChild(titleInput)

    // const divSave = document.createElement("div")
    // divSave.setAttribute("class", "comment-save")

    // const divIcon = document.createElement("i")
    // divIcon.setAttribute("class", "fa fa-comment")

    // divSave.appendChild(divIcon)

    // const commentBodyDiv = document.createElement("div")
    // commentBodyDiv.setAttribute("class", "comment")

    // const bodyTextArea = document.createElement("textarea")
    // // if it is a reply, use comment-body-postId -> like: comment-body-2
    // if(event.params["commentType"] == "submit")
    //   bodyTextArea.setAttribute("id", "comment_body")
    // else
    //   bodyTextArea.setAttribute("id", "reply-body-" + event.params["postId"])

    // bodyTextArea.setAttribute("placeholder", "Comment body here...")
    // bodyTextArea.setAttribute("class", "comment-body")

    // commentBodyDiv.appendChild(bodyTextArea)

    // const saveCommentDiv = document.createElement("div")
    // saveCommentDiv.setAttribute("data-controller", "submit_movie_post")

    // if(event.params["commentType"] == "reply")
    //   saveCommentDiv.setAttribute("data-action", "click->submit_movie_post#submitReply")
    // else
    //   saveCommentDiv.setAttribute("data-action", "click->submit_movie_post#submitPost")

    // if(event.params["commentType"] == "reply") {
    //   saveCommentDiv.setAttribute("data-submit_movie_post-post-id-param", event.params["postId"])
    //   saveCommentDiv.setAttribute("data-submit_movie_post-post-parent-id-param", event.params["postParentId"])
    // }
    
    // saveCommentDiv.setAttribute("data-submit-movie-post-target", "source")
    // if(event.params["commentType"] == "submit") {
    //   saveCommentDiv.setAttribute("class", "comment-save-btn")
    //   txt = document.createTextNode("Submit Comment")
    // }
    // else {
    //   saveCommentDiv.setAttribute("class", "reply-save-btn")
    //   txt = document.createTextNode("Submit Reply")
    // }
      
    // saveCommentDiv.appendChild(txt)

    // div2.appendChild(titleDiv)
    // div2.appendChild(divSave)
    // div1.appendChild(div2)
    // div1.appendChild(commentBodyDiv)
    // div1.appendChild(saveCommentDiv)

    // if(event.params["commentType"] == "submit") {
    //   bookendDiv1.setAttribute("data-controller", "post")
    //   bookendDiv1.insertBefore(div1, bookendDiv2)
    // }
    // else {
    //   bookendDiv1.setAttribute("data-controller", "post")
    //   bookendDiv1.insertBefore(div1, bookendDiv2)
    // }

    // btn.setAttribute("class", "remove-btn")
  }

  submitComment(event) {
    console.log("From comment: ", event.params)
    let txt = ""
    let bookendDiv1, bookendDiv2

    bookendDiv1 = document.getElementById("comments-container")
    bookendDiv2 = document.getElementById("comments-field")

    const btn = document.getElementById("add-comments-btn")
    const div1 = document.createElement("div")
    div1.setAttribute("class", "comment-container")

    const div2 = document.createElement("div")
    div2.setAttribute("class", "comment-header")

    const titleDiv = document.createElement("div")
    titleDiv.setAttribute("class", "comment-title")

    const titleInput = document.createElement("input")
    titleInput.setAttribute("id", "comment-title")
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
    saveCommentDiv.setAttribute("data-action", "click->submit_movie_post#submitReply")
    saveCommentDiv.setAttribute("data-action", "click->submit_movie_post#submitPost")

    saveCommentDiv.setAttribute("class", "comment-save-btn")
    txt = document.createTextNode("Submit Comment")

    saveCommentDiv.appendChild(txt)

    div2.appendChild(titleDiv)
    div2.appendChild(divSave)
    div1.appendChild(div2)
    div1.appendChild(commentBodyDiv)
    div1.appendChild(saveCommentDiv)

    bookendDiv1.setAttribute("data-controller", "post")
    bookendDiv1.insertBefore(div1, bookendDiv2)

    btn.setAttribute("class", "remove-btn")
  }

  submitReply(event) {
    console.log("From reply: ", event.params)
    let txt = ""
    let bookendDiv1, bookendDiv2

    bookendDiv1 = document.getElementById("comments-container")
    bookendDiv2 = document.getElementById("comment_" + event.params["postId"]).nextElementSibling

    const btn = document.getElementById("add-comments-btn")
    const div1 = document.createElement("div")
    div1.setAttribute("class", "reply-container")

    const div2 = document.createElement("div")
    div2.setAttribute("class", "reply-header")

    const titleDiv = document.createElement("div")
    titleDiv.setAttribute("class", "reply-title")

    const titleInput = document.createElement("input")
    titleInput.setAttribute("id", "reply-title-" + event.params["postId"])
    titleInput.setAttribute("class", "reply-title-input")
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
    bodyTextArea.setAttribute("id", "reply-body-" + event.params["postId"])
    bodyTextArea.setAttribute("placeholder", "Comment body here...")
    bodyTextArea.setAttribute("class", "comment-body")

    commentBodyDiv.appendChild(bodyTextArea)

    const saveCommentDiv = document.createElement("div")
    saveCommentDiv.setAttribute("data-controller", "submit_movie_post")
    saveCommentDiv.setAttribute("data-action", "click->submit_movie_post#submitPost")
    saveCommentDiv.setAttribute("data-action", "click->submit_movie_post#submitReply")
    saveCommentDiv.setAttribute("data-submit_movie_post-post-id-param", event.params["postId"])
    saveCommentDiv.setAttribute("data-submit_movie_post-post-parent-id-param", event.params["postParentId"])

    saveCommentDiv.setAttribute("class", "reply-save-btn")
    txt = document.createTextNode("Submit Reply")

    saveCommentDiv.appendChild(txt)

    div2.appendChild(titleDiv)
    div2.appendChild(divSave)
    div1.appendChild(div2)
    div1.appendChild(commentBodyDiv)
    div1.appendChild(saveCommentDiv)

    bookendDiv1.setAttribute("data-controller", "post")
    bookendDiv1.insertBefore(div1, bookendDiv2)

    btn.setAttribute("class", "remove-btn")
  }
}
