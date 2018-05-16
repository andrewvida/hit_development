var visitorTour = new Tour({
  name: "visitor-tour",
  steps: [
  {
    element: "#tour-announcements",
    title: "Stay updated",
    content: "Important announcements from each department can be found here. Don't be the last to know.",
    placement: "bottom"
  },
  {
    element: "#tour-departments",
    title: "The teams",
    content: "Here you will find information and helpful content from our Hendrick IT Teams.",
    placement: "bottom"
  },
  {
    element: "#tour-search",
    title: "Need help?",
    content: "Enter a few keywords like `telephone` or `support` to find the topics you're looking for.",
    placement: "bottom"
  },
  {
    element: "#tour-careers",
    title: "Interested in new opportunities?",
    content: "Keep an eye on new opportunities that become available. If you think you have what it takes, we want to support you!",
    placement: "bottom"
  }
]})

visitorTour.init();
visitorTour.start();

$(function(){
  $('[data-toggle="tooltip"]').tooltip()
  $('[role="alert"]').alert()
  $('#tour-help').on('click', function(){
    visitorTour.restart();
  })

})