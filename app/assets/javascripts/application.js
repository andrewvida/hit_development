// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs

var visitorTour = new Tour({
  name: "visitor-tour",
  storage:false,
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
  },
]})

visitorTour.init();
visitorTour.start();