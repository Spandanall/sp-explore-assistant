application: explore_assistant {
  label: "sp demo explorem"
  #url: "https://localhost:8080/bundle.js"
  file: "bundle_sp.js"
  entitlements: {
    core_api_methods: ["lookml_model_explore"]
    navigation: yes
    use_embeds: yes
    use_iframes: yes
    new_window: yes
    new_window_external_urls: ["https://developers.generativeai.google/*"]
    local_storage: yes
    # external_api_urls: ["https://us-central1-pandera-bi-demo.cloudfunctions.net/explore-assistant-endpoint-prod"]
    external_api_urls: ["https://us-central1-pandera-bi-demo.cloudfunctions.net"]
  }
}
