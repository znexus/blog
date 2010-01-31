# These helper methods can be called in your template to set variables to be used in the layout
# This module should be included in all views globally,
# to do so you may need to add this line to your ApplicationController
#   helper :layout
module LayoutHelper
  def title (page_title = "Consultoría en temas de desarrollo WEB y estrategia de TI",
            show_title = true)
    content_for(:head) { 
      content_tag(:title, "#{page_title.to_s} | Cristiancastillo.com")
    }
    @show_title = show_title
  end
  
  def show_title?
    @show_title
  end
  
  def description( d= "Consultoría y desarrollo de aplicaciones WEB, estratégia de negocios WEB, 
    marketing sobre WEB y temas relacionados con tecnologías de información y otras especias")
    content_for(:head) {
      tag(:meta, :name => "description" ,:content=>h(d) )
    }
  end
  
  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end
  
  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end
end
