require 'bundler'
Bundler.require

require 'csv'

$:.unshift File.expand_path("./../lib", __FILE__)


class Controller
    def initialize

    end

    def create_gossip
        @view = View.new
        gossip = @view.livre
        gossip = @view.create_gossip
        Gossip.new.save(gossip[:author],gossip[:content])
    end

    def index_gossip
        ha=[]
        CSV.foreach("/Documents/Eloomi-Project-by-Kira/the_hacking_gossip_ruby_version_POO/db/gossip.csv").with_index do |row, row_number|
            ha << {row_number+1}.{row}
        end
        puts ha

    end

    def destroy
        table=[]
        CSV.foreach("/Documents/Eloomi-Project-by-Kira/the_hacking_gossip_ruby_version_POO/db/gossip.csv").with_index do |row, row_number|
            table<< row end
        puts "Veuillez indiquer le numéro de gossip à supprimer"
        a=gets.chomp.to_i
        table.delete_at(a-1)
        File.delete("/Documents/Eloomi-project-by-Kira/the_hacking_gossip_ruby_version_POO/db/gossip.csv")
        CSV.open("/Documents/Eloomi-project-by-Kira/the_hacking_gossip_ruby_version_POO/db/gossip.csv", "a+") do |csv| table.each{|row| csv<< row}  end
    end

end
