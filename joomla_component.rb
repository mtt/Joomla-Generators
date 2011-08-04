#!/usr/bin/env ruby

require 'fileutils'

class JoomlaComponent

  include FileUtils
  
  attr_accessor :name, :template_path, :component_path, :comp_var
  attr_accessor :controller_path, :view_path,:default_view,:component_start,:template_component_start
  attr_accessor :component_document_root

  
  def initialize(name)
    self.name = name
    self.component_document_root = 'builds'
    self.template_path = 'com_COM'
    self.component_path = File.join(component_document_root,"com_#{name}")
    self.comp_var = '{COM}'
    #TODO make default view chooser work
    self.default_view    = 'default'
    self.view_path       = File.join(component_path,'views',default_view,'view.html.php')
    self.controller_path = File.join(component_path,'controller.php')
    self.component_start = File.join(component_path,"#{name}.php")
    self.template_component_start = File.join(component_path,"COM.php")
    generate!
  end
  
  private
  
    def generate!
      mkdir_p(component_document_root)
      cp_r(template_path,component_path)
      mv(template_component_start,component_start)
      file_replacements(component_start, comp_var => name.capitalize)
      file_replacements(controller_path, comp_var => name.capitalize)
      file_replacements(view_path, comp_var => name.capitalize)
    end
  
    def file_replacements(file, replacements={})
      str = File.read(file)
      replacements.each do |from,to|
        str.gsub!(from,to)
      end
      File.open(file,"w") { |f| f << str}
    end
  
end



JoomlaComponent.new('test')

