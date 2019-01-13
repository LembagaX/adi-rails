json.purchasing do
    json.provider @provider
    json.purchase @purchase
    json.materials @provider.materials
    json.code @code
end