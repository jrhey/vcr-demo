# frozen_string_literal: true

class RickAndMorty
	BASE_URL = 'https://rickandmortyapi.com/api'
	def self.fetch_characters
		resp = Net::HTTP.get_response(URI("#{BASE_URL}/character"))
	end

	def self.fetch_character(id)
		resp = Net::HTTP.get(URI("#{BASE_URL}/character/#{id}"))
		JSON.parse(resp)
	end
end
