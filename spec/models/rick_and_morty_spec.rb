# frozen_string_literal: true

require 'rails_helper'

describe RickAndMorty do
	context '.fetch_characters' do
		it 'returns a list of characters' do
			VCR.use_cassette('rick_and_morty/fetch_characters_success') do
				resp = RickAndMorty.fetch_characters
				body = JSON.parse(resp.body)
				expect(body['results']).to be_kind_of(Array)
				expect(resp.code).to eq('200')
			end
		end

		it 'fails with bad request HTTP 500' do
			VCR.use_cassette('rick_and_morty/fetch_characters_bad_req') do
				resp = RickAndMorty.fetch_characters
				body = JSON.parse(resp.body)
				expect(resp.code).to eq('500')
			end
		end
	end

	context '.fetch_character' do
		let (:character_id) { 1 }
		it 'returns a list of characters' do
			VCR.use_cassette("rick_and_morty/fetch_character_#{character_id}_success") do
				resp = RickAndMorty.fetch_character(character_id)
				expect(resp['name']).to eq('Rick Sanchez')
			end
		end
	end
end
