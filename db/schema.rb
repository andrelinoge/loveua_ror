# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150421163537) do

  create_table "article_comments", force: :cascade do |t|
    t.integer  "item_id",          limit: 4,     null: false
    t.integer  "comment_owner_id", limit: 4,     null: false
    t.text     "text",             limit: 65535
    t.integer  "mark",             limit: 1,     null: false
    t.datetime "created_at",                     null: false
  end

  create_table "article_comments_2lvl", force: :cascade do |t|
    t.integer  "comment_id",       limit: 4,     null: false
    t.integer  "comment_owner_id", limit: 4,     null: false
    t.text     "text",             limit: 65535
    t.datetime "created_at",                     null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title",       limit: 255,   null: false
    t.string   "keywords",    limit: 255,   null: false
    t.string   "description", limit: 255,   null: false
    t.text     "short_text",  limit: 65535, null: false
    t.text     "text",        limit: 65535, null: false
    t.datetime "created_at"
    t.string   "url",         limit: 255,   null: false
    t.string   "image",       limit: 64,    null: false
    t.integer  "views",       limit: 4,     null: false
    t.integer  "comments",    limit: 4,     null: false
  end

  create_table "avatar_comments", force: :cascade do |t|
    t.integer  "item_id",          limit: 4,     null: false
    t.integer  "comment_owner_id", limit: 4,     null: false
    t.text     "text",             limit: 65535, null: false
    t.integer  "mark",             limit: 1,     null: false
    t.datetime "created_at",                     null: false
  end

  add_index "avatar_comments", ["comment_owner_id"], name: "comment_owner_id", using: :btree
  add_index "avatar_comments", ["item_id", "comment_owner_id"], name: "item_id", using: :btree

  create_table "avatar_comments_2lvl", force: :cascade do |t|
    t.integer  "comment_id",       limit: 4,     null: false
    t.integer  "comment_owner_id", limit: 4,     null: false
    t.text     "text",             limit: 65535, null: false
    t.datetime "created_at",                     null: false
  end

  add_index "avatar_comments_2lvl", ["comment_id", "comment_owner_id"], name: "comment_id", using: :btree
  add_index "avatar_comments_2lvl", ["comment_owner_id"], name: "comment_owner_id", using: :btree

  create_table "blacklist", id: false, force: :cascade do |t|
    t.integer "reason_id",       limit: 4, null: false
    t.integer "user_id",         limit: 4, null: false
    t.integer "blocked_user_id", limit: 4, null: false
  end

  add_index "blacklist", ["blocked_user_id"], name: "idx_blocked_user", using: :btree
  add_index "blacklist", ["reason_id"], name: "idx_reason", using: :btree
  add_index "blacklist", ["user_id", "blocked_user_id"], name: "idx_users", unique: true, using: :btree
  add_index "blacklist", ["user_id"], name: "idx_user", using: :btree

  create_table "blacklist_reason", force: :cascade do |t|
    t.string  "title",  limit: 255
    t.integer "weight", limit: 1
  end

  add_index "blacklist_reason", ["weight"], name: "idx_weight", using: :btree

  create_table "bonus_transactions", force: :cascade do |t|
    t.integer "user_id",     limit: 4,   null: false
    t.integer "payment_id",  limit: 4,   null: false
    t.integer "amount",      limit: 4,   null: false
    t.string  "description", limit: 250
    t.integer "created_at",  limit: 4
    t.integer "updated_at",  limit: 4
  end

  add_index "bonus_transactions", ["user_id"], name: "user_id", using: :btree

  create_table "bot_content", force: :cascade do |t|
    t.integer  "module_id",  limit: 4,     null: false
    t.text     "text",       limit: 65535, null: false
    t.string   "lang",       limit: 2,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bot_content", ["module_id"], name: "module_FK1", using: :btree

  create_table "bot_events", force: :cascade do |t|
    t.integer  "bot_id",     limit: 4,  null: false
    t.integer  "event_type", limit: 1,  null: false
    t.integer  "user_id",    limit: 4
    t.string   "custom_1",   limit: 16
    t.integer  "custom_2",   limit: 4
    t.integer  "custom_3",   limit: 4
    t.datetime "created_at",            null: false
  end

  add_index "bot_events", ["bot_id", "event_type", "custom_1"], name: "idx3", using: :btree
  add_index "bot_events", ["bot_id", "event_type", "custom_2"], name: "idx4", using: :btree
  add_index "bot_events", ["bot_id", "event_type", "user_id", "custom_1"], name: "idx1", using: :btree
  add_index "bot_events", ["bot_id", "event_type", "user_id", "custom_2"], name: "idx2", using: :btree

  create_table "bot_messages", force: :cascade do |t|
    t.integer  "type",       limit: 1,     null: false
    t.string   "lang",       limit: 2,     null: false
    t.text     "text",       limit: 65535, null: false
    t.string   "mask",       limit: 255
    t.datetime "created_at",               null: false
  end

  add_index "bot_messages", ["type", "lang", "mask"], name: "idx1", using: :btree

  create_table "bot_module", force: :cascade do |t|
    t.string   "title",      limit: 50,                 null: false
    t.string   "action",     limit: 50,                 null: false
    t.boolean  "has_text",   limit: 1,  default: false, null: false
    t.boolean  "is_active",  limit: 1,  default: false, null: false
    t.datetime "created_at",                            null: false
  end

  create_table "bot_settings", force: :cascade do |t|
    t.integer "user_id",  limit: 4,     null: false
    t.text    "settings", limit: 65535, null: false
  end

  add_index "bot_settings", ["user_id"], name: "bot_FK1", using: :btree

  create_table "cities", primary_key: "_id", force: :cascade do |t|
    t.integer "id",                  limit: 4,   default: 0,     null: false
    t.integer "region_id",           limit: 4,                   null: false
    t.string  "lang",                limit: 2,                   null: false
    t.string  "name",                limit: 255,                 null: false
    t.string  "locative_name",       limit: 255,                 null: false
    t.string  "possessive_name",     limit: 255,                 null: false
    t.string  "transliterated_name", limit: 255,                 null: false
    t.integer "token",               limit: 4,                   null: false
    t.boolean "region_center",       limit: 1,   default: false, null: false
  end

  add_index "cities", ["id"], name: "id", using: :btree
  add_index "cities", ["lang"], name: "lang", using: :btree
  add_index "cities", ["region_id"], name: "region_id", using: :btree
  add_index "cities", ["token"], name: "token", using: :btree

  create_table "city_articles", force: :cascade do |t|
    t.string  "lang",    limit: 2
    t.integer "city_id", limit: 4
    t.text    "content", limit: 65535
  end

  add_index "city_articles", ["city_id"], name: "city_id", using: :btree

  create_table "contact_us", force: :cascade do |t|
    t.string   "email",      limit: 50,                null: false
    t.text     "content",    limit: 65535,             null: false
    t.datetime "created_at",                           null: false
    t.integer  "user_id",    limit: 4,     default: 0, null: false
    t.integer  "sent",       limit: 4,     default: 0, null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.string   "hash",             limit: 32
    t.integer  "user1_id",         limit: 4,                  null: false
    t.integer  "user2_id",         limit: 4,                  null: false
    t.boolean  "hidden_for_user1", limit: 1,  default: false, null: false
    t.boolean  "hidden_for_user2", limit: 1,  default: false, null: false
    t.integer  "messages_count",   limit: 4,  default: 0,     null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at"
  end

  add_index "conversations", ["hash"], name: "hash", using: :btree
  add_index "conversations", ["user1_id", "hidden_for_user1"], name: "user1", using: :btree
  add_index "conversations", ["user2_id", "hidden_for_user2"], name: "user2", using: :btree

  create_table "face_index", force: :cascade do |t|
    t.integer "user_id",     limit: 4,  null: false
    t.integer "index_date",  limit: 4,  null: false
    t.integer "total_faces", limit: 4,  null: false
    t.string  "user_group",  limit: 16, null: false
  end

  create_table "faq", force: :cascade do |t|
    t.integer  "faq_id",      limit: 4,     null: false
    t.string   "title",       limit: 50,    null: false
    t.text     "description", limit: 65535, null: false
    t.string   "lang",        limit: 2,     null: false
    t.datetime "created_at",                null: false
  end

  create_table "gift_categories", force: :cascade do |t|
    t.string "title_ru", limit: 255
    t.string "title_ua", limit: 255
  end

  create_table "gifts", force: :cascade do |t|
    t.string  "image",       limit: 255,                null: false
    t.integer "price",       limit: 4,                  null: false
    t.boolean "is_active",   limit: 1,   default: true, null: false
    t.integer "category_id", limit: 4
  end

  add_index "gifts", ["category_id"], name: "category_id", using: :btree

  create_table "image_comments", force: :cascade do |t|
    t.integer  "item_id",          limit: 4,     null: false
    t.integer  "comment_owner_id", limit: 4,     null: false
    t.text     "text",             limit: 65535, null: false
    t.integer  "mark",             limit: 1,     null: false
    t.datetime "created_at",                     null: false
  end

  add_index "image_comments", ["comment_owner_id"], name: "comment_owner_id", using: :btree
  add_index "image_comments", ["item_id"], name: "item_id", using: :btree

  create_table "image_comments_2lvl", force: :cascade do |t|
    t.integer  "comment_id",       limit: 4,     null: false
    t.integer  "comment_owner_id", limit: 4,     null: false
    t.text     "text",             limit: 65535, null: false
    t.datetime "created_at",                     null: false
  end

  add_index "image_comments_2lvl", ["comment_id", "comment_owner_id"], name: "comment_id", using: :btree
  add_index "image_comments_2lvl", ["comment_owner_id"], name: "comment_owner_id", using: :btree

  create_table "image_estimates", force: :cascade do |t|
    t.integer  "voter_id",   limit: 4
    t.integer  "item_id",    limit: 4
    t.integer  "estimate",   limit: 1
    t.datetime "created_at",           null: false
  end

  add_index "image_estimates", ["item_id"], name: "item_id", using: :btree

  create_table "kisszpua_pages", primary_key: "url", force: :cascade do |t|
  end

  create_table "kisszpua_users", force: :cascade do |t|
    t.string  "url",   limit: 255, null: false
    t.string  "email", limit: 129
    t.string  "phone", limit: 30
    t.string  "name",  limit: 100, null: false
    t.string  "city",  limit: 50
    t.integer "age",   limit: 4
  end

  add_index "kisszpua_users", ["email"], name: "uniq_email", unique: true, using: :btree
  add_index "kisszpua_users", ["url"], name: "uniq_url", unique: true, using: :btree

  create_table "locations", force: :cascade do |t|
    t.string "lang",                  limit: 2,   null: false
    t.string "region",                limit: 255, null: false
    t.string "region_locative",       limit: 255, null: false
    t.string "region_possessive",     limit: 255, null: false
    t.string "city",                  limit: 255, null: false
    t.string "city_locative",         limit: 255, null: false
    t.string "city_possessive",       limit: 255, null: false
    t.string "region_transliterated", limit: 255, null: false
    t.string "city_transliterated",   limit: 255, null: false
  end

  add_index "locations", ["lang"], name: "lang", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "conversation_id", limit: 4,                    null: false
    t.integer  "sender_id",       limit: 4,                    null: false
    t.integer  "recipient_id",    limit: 4,                    null: false
    t.boolean  "is_new",          limit: 1,     default: true, null: false
    t.text     "text",            limit: 65535,                null: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at"
  end

  add_index "messages", ["conversation_id", "recipient_id", "is_new"], name: "conversation_recipient", using: :btree
  add_index "messages", ["conversation_id", "sender_id", "is_new"], name: "conversation_sender", using: :btree
  add_index "messages", ["recipient_id", "is_new"], name: "recipient", using: :btree

  create_table "oauth2_clients", primary_key: "client_id", force: :cascade do |t|
    t.string "client_secret", limit: 32,  null: false
    t.string "redirect_uri",  limit: 255
  end

  add_index "oauth2_clients", ["client_id"], name: "client_id", unique: true, using: :btree

  create_table "oauth2_tokens", primary_key: "oauth_token", force: :cascade do |t|
    t.integer "token_type",   limit: 1
    t.string  "client_id",    limit: 8
    t.integer "expires",      limit: 4
    t.integer "user_id",      limit: 4
    t.string  "redirect_uri", limit: 255
    t.string  "scope",        limit: 16
  end

  add_index "oauth2_tokens", ["client_id"], name: "client_id", using: :btree
  add_index "oauth2_tokens", ["oauth_token"], name: "oauth_token", unique: true, using: :btree
  add_index "oauth2_tokens", ["user_id"], name: "user_id", using: :btree

  create_table "offers", force: :cascade do |t|
    t.integer "offer_id", limit: 4,  null: false
    t.integer "user_id",  limit: 4,  null: false
    t.float   "amount",   limit: 53, null: false
  end

  add_index "offers", ["offer_id", "user_id"], name: "uniq_offer_user", unique: true, using: :btree
  add_index "offers", ["offer_id"], name: "idx_offer", using: :btree
  add_index "offers", ["user_id"], name: "idx_user", using: :btree

  create_table "parser_users", force: :cascade do |t|
    t.string  "email",                limit: 128,                 null: false
    t.string  "user_name",            limit: 256,                 null: false
    t.string  "created_at",           limit: 64,                  null: false
    t.string  "last_login",           limit: 64,                  null: false
    t.integer "android_app",          limit: 4,                   null: false
    t.integer "apple_app",            limit: 4,                   null: false
    t.string  "vkontakte_id",         limit: 64,                  null: false
    t.string  "region_name",          limit: 64
    t.string  "region_locative",      limit: 128,                 null: false
    t.string  "region_possessive",    limit: 128,                 null: false
    t.string  "subregion_name",       limit: 128
    t.string  "subregion_locative",   limit: 128,                 null: false
    t.string  "subregion_possessive", limit: 128,                 null: false
    t.integer "sent",                 limit: 4,   default: 0,     null: false
    t.string  "server",               limit: 50
    t.string  "sent_at",              limit: 16
    t.boolean "unsub",                limit: 1,   default: false, null: false
  end

  add_index "parser_users", ["email"], name: "email", using: :btree
  add_index "parser_users", ["sent_at", "sent"], name: "sent_at", using: :btree

  create_table "payments", force: :cascade do |t|
    t.integer  "user_id",             limit: 4,                   null: false
    t.integer  "amount",              limit: 4,                   null: false
    t.datetime "created_at"
    t.integer  "type",                limit: 4,                   null: false
    t.integer  "item_id",             limit: 4,     default: 0,   null: false
    t.datetime "updated_at"
    t.integer  "is_direct",           limit: 1
    t.integer  "status",              limit: 1
    t.text     "error",               limit: 65535
    t.string   "comment",             limit: 250
    t.string   "order_id",            limit: 255
    t.string   "phone",               limit: 30
    t.string   "payment_platform",    limit: 30
    t.float    "finite_amount",       limit: 24,    default: 0.0
    t.integer  "uid",                 limit: 4
    t.datetime "updated_by_admin_at"
  end

  add_index "payments", ["uid"], name: "idx_uid", using: :btree
  add_index "payments", ["uid"], name: "uid", unique: true, using: :btree

  create_table "promo_codes", force: :cascade do |t|
    t.integer  "user_id",     limit: 4,   default: 0, null: false
    t.string   "campain",     limit: 255,             null: false
    t.string   "code",        limit: 20,              null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.datetime "assigned_at",                         null: false
    t.integer  "is_shown",    limit: 1,   default: 0, null: false
  end

  add_index "promo_codes", ["user_id"], name: "user_id", using: :btree

  create_table "quasi_payments", force: :cascade do |t|
    t.integer  "payment_id",       limit: 4
    t.integer  "uid",              limit: 4,  null: false
    t.integer  "user_id",          limit: 4
    t.integer  "item_id",          limit: 4
    t.float    "amount",           limit: 24
    t.float    "finite_amount",    limit: 24
    t.string   "phone",            limit: 20
    t.string   "order_id",         limit: 50
    t.boolean  "type",             limit: 1
    t.boolean  "status",           limit: 1
    t.string   "payment_platform", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quasi_payments", ["uid"], name: "index_uid", using: :btree

  create_table "regions", primary_key: "_id", force: :cascade do |t|
    t.integer "id",                  limit: 4,   default: 0, null: false
    t.string  "lang",                limit: 2,               null: false
    t.string  "name",                limit: 255,             null: false
    t.string  "locative_name",       limit: 255,             null: false
    t.string  "possessive_name",     limit: 255,             null: false
    t.string  "transliterated_name", limit: 255,             null: false
    t.integer "token",               limit: 4,               null: false
  end

  add_index "regions", ["id"], name: "id", using: :btree
  add_index "regions", ["lang"], name: "lang", using: :btree
  add_index "regions", ["token"], name: "token", using: :btree

  create_table "remembered_users", force: :cascade do |t|
    t.integer "user_id",       limit: 4,     null: false
    t.integer "remembered_id", limit: 4,     null: false
    t.integer "date",          limit: 4,     null: false
    t.text    "comment",       limit: 65535, null: false
  end

  create_table "seo", force: :cascade do |t|
    t.string "page_url",    limit: 255
    t.string "header",      limit: 255
    t.string "title",       limit: 255
    t.text   "keywords",    limit: 65535
    t.text   "description", limit: 65535
  end

  add_index "seo", ["page_url"], name: "page_url", using: :btree

  create_table "seo_templates", force: :cascade do |t|
    t.string "page_url",    limit: 255
    t.string "header",      limit: 255
    t.string "title",       limit: 255
    t.text   "keywords",    limit: 65535
    t.text   "description", limit: 65535
  end

  add_index "seo_templates", ["page_url"], name: "page_url", using: :btree

  create_table "simpationers", force: :cascade do |t|
    t.integer  "winner_profile_id",  limit: 4, null: false
    t.integer  "looser_profile_id",  limit: 4, null: false
    t.integer  "chooser_profile_id", limit: 4, null: false
    t.datetime "created_at",                   null: false
  end

  add_index "simpationers", ["chooser_profile_id"], name: "symfations_fk_chooser_profile_id", using: :btree
  add_index "simpationers", ["looser_profile_id"], name: "sympathy_looser_fk", using: :btree
  add_index "simpationers", ["winner_profile_id"], name: "sympathy_winner_fk", using: :btree

  create_table "slando_mailing", force: :cascade do |t|
    t.string  "date",       limit: 16, null: false
    t.integer "sent_today", limit: 4,  null: false
  end

  create_table "slando_users", force: :cascade do |t|
    t.string  "email",                limit: 128,                 null: false
    t.string  "user_name",            limit: 256,                 null: false
    t.string  "created_at",           limit: 64,                  null: false
    t.string  "last_login",           limit: 64,                  null: false
    t.integer "android_app",          limit: 4,                   null: false
    t.integer "apple_app",            limit: 4,                   null: false
    t.string  "vkontakte_id",         limit: 64,                  null: false
    t.string  "region_name",          limit: 64,                  null: false
    t.string  "region_locative",      limit: 128,                 null: false
    t.string  "region_possessive",    limit: 128,                 null: false
    t.string  "subregion_name",       limit: 128,                 null: false
    t.string  "subregion_locative",   limit: 128,                 null: false
    t.string  "subregion_possessive", limit: 128,                 null: false
    t.integer "sent",                 limit: 4,   default: 0,     null: false
    t.string  "server",               limit: 50
    t.string  "sent_at",              limit: 16
    t.boolean "unsub",                limit: 1,   default: false, null: false
  end

  add_index "slando_users", ["email"], name: "email", using: :btree
  add_index "slando_users", ["sent_at", "sent"], name: "sent_at", using: :btree

  create_table "slandomail_datasent", force: :cascade do |t|
    t.string  "region_name", limit: 128, null: false
    t.string  "date",        limit: 64,  null: false
    t.integer "count",       limit: 4,   null: false
  end

  create_table "social_lovers", primary_key: "lover_id", force: :cascade do |t|
    t.string  "param",       limit: 32, null: false
    t.integer "param_min",   limit: 8
    t.integer "param_max",   limit: 8
    t.integer "percent_min", limit: 4
    t.integer "percent_max", limit: 4
  end

  create_table "social_rating", primary_key: "user_id", force: :cascade do |t|
    t.integer "rating",        limit: 4, null: false
    t.integer "is_registered", limit: 4, null: false
  end

  create_table "social_ratings", primary_key: "user_id", force: :cascade do |t|
    t.integer "rating",        limit: 4
    t.integer "invites",       limit: 1
    t.integer "is_registered", limit: 1
  end

  add_index "social_ratings", ["rating"], name: "rating", using: :btree
  add_index "social_ratings", ["user_id"], name: "user_id", unique: true, using: :btree

  create_table "sphinx_delta", id: false, force: :cascade do |t|
    t.string  "index_name", limit: 12, null: false
    t.integer "item_id",    limit: 4,  null: false
  end

  create_table "split_tests", force: :cascade do |t|
    t.string   "name",       limit: 50
    t.integer  "ip",         limit: 4
    t.string   "variant",    limit: 1
    t.datetime "created_at"
    t.integer  "successful", limit: 1,  default: 0, null: false
  end

  add_index "split_tests", ["ip"], name: "idx_ip", using: :btree

  create_table "tbl_migration", primary_key: "version", force: :cascade do |t|
    t.integer "apply_time", limit: 4
  end

  create_table "temp_emails", id: false, force: :cascade do |t|
    t.string "email", limit: 64, null: false
  end

  create_table "updates", force: :cascade do |t|
    t.integer  "type",         limit: 1,     null: false
    t.integer  "sender_id",    limit: 4
    t.integer  "recipient_id", limit: 4,     null: false
    t.binary   "user_data",    limit: 65535
    t.datetime "created",                    null: false
  end

  add_index "updates", ["recipient_id", "created"], name: "recipient", using: :btree
  add_index "updates", ["recipient_id", "type", "created"], name: "recipient_t", using: :btree
  add_index "updates", ["sender_id", "created"], name: "sender", using: :btree
  add_index "updates", ["sender_id", "type", "created"], name: "sender_t", using: :btree
  add_index "updates", ["type", "created"], name: "type", using: :btree

  create_table "url_articles", force: :cascade do |t|
    t.string "lang",    limit: 2
    t.string "url",     limit: 255
    t.text   "content", limit: 65535
  end

  add_index "url_articles", ["lang", "url"], name: "lang_url_uniq", unique: true, using: :btree
  add_index "url_articles", ["lang"], name: "lang_idx", using: :btree
  add_index "url_articles", ["url"], name: "url_idx", using: :btree

  create_table "user", force: :cascade do |t|
    t.string   "password",               limit: 40,                  null: false
    t.string   "salt",                   limit: 10,                  null: false
    t.string   "email",                  limit: 129
    t.boolean  "role",                   limit: 1,   default: true,  null: false
    t.boolean  "is_bot",                 limit: 1,   default: false, null: false
    t.boolean  "is_bot_active",          limit: 1,   default: false, null: false
    t.boolean  "is_active",              limit: 1,   default: true,  null: false
    t.boolean  "is_banned",              limit: 1,   default: false, null: false
    t.boolean  "is_email_activated",     limit: 1,   default: true,  null: false
    t.datetime "created_at",                                         null: false
    t.boolean  "is_deleted",             limit: 1,   default: false
    t.boolean  "deleting_reason",        limit: 1
    t.datetime "deleted_at"
    t.string   "custom_deleting_reason", limit: 255
    t.integer  "position",               limit: 4
    t.integer  "social_only",            limit: 1,   default: 0,     null: false
    t.string   "original_password",      limit: 250
    t.integer  "is_moderated",           limit: 1,   default: 0
  end

  add_index "user", ["email"], name: "email", unique: true, using: :btree

  create_table "user_activation", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,   null: false
    t.string   "uri",        limit: 255, null: false
    t.datetime "created_at",             null: false
  end

  add_index "user_activation", ["user_id"], name: "act_user_id_fk", unique: true, using: :btree

  create_table "user_activation_sent", force: :cascade do |t|
    t.integer "user_id",     limit: 4,  null: false
    t.string  "email",       limit: 64, null: false
    t.integer "time_passed", limit: 4,  null: false
  end

  create_table "user_avatar", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,                   null: false
    t.string   "image",      limit: 255,                 null: false
    t.boolean  "is_main",    limit: 1,   default: false, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "user_avatar", ["is_main"], name: "user_avatar_is_main", using: :btree
  add_index "user_avatar", ["user_id"], name: "user_id_fk", using: :btree

  create_table "user_counter", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,              null: false
    t.string   "key",        limit: 50
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "count",      limit: 4,  default: 0
  end

  add_index "user_counter", ["user_id", "key", "start_date", "end_date"], name: "idx_user_key_dates", using: :btree
  add_index "user_counter", ["user_id"], name: "idx_user", using: :btree

  create_table "user_facebook", force: :cascade do |t|
    t.integer "user_id",  limit: 4,   null: false
    t.integer "fb_id",    limit: 8,   null: false
    t.string  "fb_token", limit: 255, null: false
  end

  add_index "user_facebook", ["fb_id"], name: "db_id", using: :btree
  add_index "user_facebook", ["user_id"], name: "user_id", using: :btree
  add_index "user_facebook", ["user_id"], name: "user_id_2", using: :btree
  add_index "user_facebook", ["user_id"], name: "user_id_3", using: :btree

  create_table "user_gifts", force: :cascade do |t|
    t.integer  "sender_id",    limit: 4,     null: false
    t.integer  "receiver_id",  limit: 4,     null: false
    t.integer  "gift_id",      limit: 4,     null: false
    t.text     "message",      limit: 65535, null: false
    t.datetime "sent_at",                    null: false
    t.boolean  "is_anonymous", limit: 1,     null: false
    t.integer  "is_paid",      limit: 1
  end

  add_index "user_gifts", ["gift_id"], name: "gift_id", using: :btree
  add_index "user_gifts", ["receiver_id"], name: "receiver_id", using: :btree
  add_index "user_gifts", ["sender_id", "receiver_id", "gift_id"], name: "sender_id", using: :btree

  create_table "user_guests", force: :cascade do |t|
    t.integer  "user_id",    limit: 4, null: false
    t.integer  "guest_id",   limit: 4, null: false
    t.datetime "visit_date",           null: false
  end

  add_index "user_guests", ["guest_id"], name: "guests_guest_id", using: :btree
  add_index "user_guests", ["user_id"], name: "guests_user_id", using: :btree

  create_table "user_image", force: :cascade do |t|
    t.integer  "user_id",          limit: 4,                   null: false
    t.string   "image",            limit: 255,                 null: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.boolean  "is_avatar",        limit: 1,   default: false, null: false
    t.boolean  "in_tape",          limit: 1,   default: false
    t.datetime "added_to_tape_at"
    t.integer  "user_sex",         limit: 1
    t.string   "face_id",          limit: 250
    t.integer  "face_set",         limit: 2
    t.integer  "is_moderated",     limit: 1,   default: 0
  end

  add_index "user_image", ["face_id"], name: "face_id", using: :btree
  add_index "user_image", ["user_id"], name: "user_image_user_id_fk", using: :btree

  create_table "user_languages", force: :cascade do |t|
    t.integer "user_id", limit: 4,                 null: false
    t.boolean "russian", limit: 1, default: false, null: false
    t.boolean "english", limit: 1, default: false, null: false
    t.boolean "german",  limit: 1, default: false, null: false
    t.boolean "french",  limit: 1, default: false, null: false
    t.boolean "spanish", limit: 1, default: false, null: false
    t.boolean "italian", limit: 1, default: false, null: false
    t.boolean "polish",  limit: 1, default: false, null: false
  end

  add_index "user_languages", ["user_id"], name: "user_id", using: :btree

  create_table "user_looking_for", force: :cascade do |t|
    t.integer "user_id",  limit: 4,                 null: false
    t.boolean "friend",   limit: 1, default: false, null: false
    t.boolean "chat",     limit: 1, default: false, null: false
    t.boolean "marriage", limit: 1, default: false, null: false
    t.boolean "roommate", limit: 1, default: false, null: false
    t.boolean "love",     limit: 1, default: false, null: false
    t.boolean "sex",      limit: 1, default: false, null: false
    t.boolean "child",    limit: 1, default: false, null: false
    t.boolean "sport",    limit: 1, default: false, null: false
  end

  add_index "user_looking_for", ["user_id"], name: "user_id", unique: true, using: :btree

  create_table "user_mailru", force: :cascade do |t|
    t.integer "user_id",         limit: 4,   null: false
    t.string  "foreign_user_id", limit: 32,  null: false
    t.string  "token",           limit: 128, null: false
  end

  add_index "user_mailru", ["user_id", "foreign_user_id"], name: "uniq_user", unique: true, using: :btree
  add_index "user_mailru", ["user_id"], name: "idx_user", using: :btree

  create_table "user_meet", force: :cascade do |t|
    t.integer "user_id",     limit: 4,                     null: false
    t.boolean "man",         limit: 1,     default: false, null: false
    t.boolean "woman",       limit: 1,     default: false, null: false
    t.boolean "couple_m_m",  limit: 1,     default: false, null: false
    t.boolean "couple_w_w",  limit: 1,     default: false, null: false
    t.boolean "couple_m_w",  limit: 1,     default: false, null: false
    t.text    "description", limit: 65535
  end

  add_index "user_meet", ["user_id"], name: "user_id", unique: true, using: :btree

  create_table "user_mood_reminding_sent", force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "date",    limit: 8
  end

  add_index "user_mood_reminding_sent", ["date"], name: "date", using: :btree

  create_table "user_moods", force: :cascade do |t|
    t.string "value_ru", limit: 255, null: false
    t.string "class",    limit: 32,  null: false
    t.string "value_ua", limit: 255
  end

  create_table "user_password_recovery", force: :cascade do |t|
    t.integer "user_id",    limit: 4
    t.string  "url",        limit: 255
    t.integer "expired_at", limit: 4
  end

  create_table "user_photoReminding_sent", force: :cascade do |t|
    t.integer "user_id",  limit: 4, null: false
    t.integer "date",     limit: 4, null: false
    t.string  "language", limit: 4, null: false
  end

  create_table "user_profile", force: :cascade do |t|
    t.integer  "user_id",          limit: 4,                   null: false
    t.string   "first_name",       limit: 255,                 null: false
    t.string   "last_name",        limit: 255, default: "",    null: false
    t.integer  "birthday",         limit: 4,   default: 0,     null: false
    t.boolean  "sex",              limit: 1,                   null: false
    t.string   "country_id",       limit: 2,   default: "",    null: false
    t.integer  "city_id",          limit: 4,   default: 0,     null: false
    t.integer  "icq",              limit: 4
    t.string   "skype",            limit: 255, default: "",    null: false
    t.string   "phone",            limit: 20,  default: "",    null: false
    t.boolean  "is_star",          limit: 1,   default: false, null: false
    t.boolean  "is_premium",       limit: 1,   default: false, null: false
    t.integer  "mood_id",          limit: 4
    t.integer  "region_id",        limit: 4,                   null: false
    t.integer  "images_changed",   limit: 4,                   null: false
    t.boolean  "aristocrats_vote", limit: 1,   default: false, null: false
    t.datetime "first_visit_at"
  end

  add_index "user_profile", ["mood_id"], name: "mood_id", using: :btree
  add_index "user_profile", ["user_id"], name: "user_pr_user_id_fk", unique: true, using: :btree

  create_table "user_profile_reminding_sent", force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.boolean "stage",   limit: 1
    t.integer "date",    limit: 8
  end

  add_index "user_profile_reminding_sent", ["date"], name: "date", using: :btree

  create_table "user_questionary", force: :cascade do |t|
    t.integer "user_id",           limit: 4,                 null: false
    t.integer "height",            limit: 2
    t.integer "weight",            limit: 2
    t.text    "about_me",          limit: 65535,             null: false
    t.integer "preferred_min_age", limit: 4
    t.integer "preferred_max_age", limit: 4
    t.integer "star_sign",         limit: 2,     default: 0
    t.integer "relationship",      limit: 2,     default: 0
    t.integer "orientation",       limit: 2,     default: 0
    t.integer "appearance",        limit: 2,     default: 0
    t.string  "custom_appearance", limit: 50
    t.integer "constitution",      limit: 2,     default: 0
    t.integer "accommodation",     limit: 2,     default: 0
    t.integer "children",          limit: 2,     default: 0
    t.integer "smoking",           limit: 2,     default: 0
    t.integer "drinking",          limit: 2,     default: 0
    t.integer "income",            limit: 2,     default: 0
    t.integer "education",         limit: 2,     default: 0
  end

  add_index "user_questionary", ["user_id"], name: "user_id", unique: true, using: :btree

  create_table "user_rating", force: :cascade do |t|
    t.integer  "user_id",                limit: 4,                 null: false
    t.integer  "summary",                limit: 1, default: 0,     null: false
    t.integer  "sociability",            limit: 1, default: 0,     null: false
    t.integer  "openness",               limit: 1, default: 0,     null: false
    t.boolean  "have_avatar",            limit: 1, default: false, null: false
    t.integer  "photos_count",           limit: 4, default: 0,     null: false
    t.boolean  "have_about_me",          limit: 1, default: false, null: false
    t.boolean  "have_looking_for",       limit: 1, default: false, null: false
    t.boolean  "have_height",            limit: 1, default: false, null: false
    t.boolean  "have_weight",            limit: 1, default: false, null: false
    t.boolean  "have_meet",              limit: 1, default: false, null: false
    t.integer  "popularity",             limit: 1, default: 0,     null: false
    t.integer  "marks_rating",           limit: 1, default: 0,     null: false
    t.integer  "marks_count",            limit: 4, default: 0,     null: false
    t.integer  "marks_sum",              limit: 4, default: 0,     null: false
    t.integer  "guests",                 limit: 1, default: 0,     null: false
    t.integer  "sympathy",               limit: 1, default: 0,     null: false
    t.integer  "sympathy_wins",          limit: 4, default: 0,     null: false
    t.integer  "sympathy_total_battles", limit: 4, default: 0,     null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "user_rating", ["user_id"], name: "rating_user_fk", unique: true, using: :btree

  create_table "user_search_criteria", force: :cascade do |t|
    t.integer "user_id", limit: 4, null: false
  end

  add_index "user_search_criteria", ["id"], name: "id", unique: true, using: :btree

  create_table "user_vkontakte", force: :cascade do |t|
    t.integer "user_id",  limit: 4,   null: false
    t.integer "vk_id",    limit: 4,   null: false
    t.string  "vk_token", limit: 128, null: false
  end

  add_index "user_vkontakte", ["user_id", "vk_id"], name: "user_id", using: :btree
  add_index "user_vkontakte", ["vk_id"], name: "vk_id", unique: true, using: :btree

  create_table "user_wallets", force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.float   "money",   limit: 53
    t.float   "bonus",   limit: 53
  end

  add_index "user_wallets", ["user_id"], name: "user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",            limit: 255
    t.string   "password_digest",  limit: 255
    t.integer  "role",             limit: 4
    t.integer  "gender",           limit: 4
    t.boolean  "is_email_confirm", limit: 1
    t.string   "avatar",           limit: 255
    t.string   "name",             limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "users_activity", force: :cascade do |t|
    t.integer  "user_id",     limit: 4, null: false
    t.datetime "activity_at"
    t.integer  "page_views",  limit: 2
  end

  add_index "users_activity", ["activity_at"], name: "activity_at", using: :btree
  add_index "users_activity", ["user_id"], name: "idx_user_id", using: :btree

  create_table "users_auth_log", force: :cascade do |t|
    t.integer  "user_id",   limit: 4,  null: false
    t.datetime "logged_at",            null: false
    t.string   "method",    limit: 20, null: false
  end

  create_table "users_loyalty", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,  null: false
    t.string   "voted_on",   limit: 50
    t.boolean  "took_part",  limit: 1,  null: false
    t.datetime "created_at"
  end

  add_index "users_loyalty", ["user_id"], name: "idx_user_id", using: :btree

  create_table "users_registration_info", force: :cascade do |t|
    t.integer "user_id",           limit: 4,   null: false
    t.string  "source",            limit: 100, null: false
    t.string  "referral",          limit: 100
    t.integer "tracking_activity", limit: 1,   null: false
    t.integer "status",            limit: 1,   null: false
    t.string  "form_variant",      limit: 3
    t.string  "origin",            limit: 20
  end

  add_index "users_registration_info", ["user_id"], name: "user_id", using: :btree

  create_table "wall", force: :cascade do |t|
    t.integer "user_id",    limit: 4,     null: false
    t.text    "text",       limit: 65535, null: false
    t.integer "created_at", limit: 4,     null: false
    t.integer "owner_id",   limit: 4,     null: false
  end

  add_index "wall", ["owner_id"], name: "owner_id", using: :btree
  add_index "wall", ["user_id"], name: "user_id", using: :btree

  create_table "wall_comments", force: :cascade do |t|
    t.integer "wall_id",       limit: 4,     null: false
    t.integer "wall_owner_id", limit: 4,     null: false
    t.integer "user_id",       limit: 4,     null: false
    t.text    "text",          limit: 65535, null: false
    t.integer "created_at",    limit: 4,     null: false
  end

  add_index "wall_comments", ["wall_id"], name: "wall_id", using: :btree

  add_foreign_key "blacklist", "blacklist_reason", column: "reason_id", name: "fk_bl_reason", on_update: :cascade, on_delete: :cascade
  add_foreign_key "blacklist", "user", column: "blocked_user_id", name: "fk_bl_blocked_user", on_update: :cascade, on_delete: :cascade
  add_foreign_key "blacklist", "user", name: "fk_bl_user", on_update: :cascade, on_delete: :cascade
  add_foreign_key "offers", "user", name: "fk_offerings_user", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_counter", "user", name: "fk_user", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_mailru", "user", name: "fk_user_mailru_user", on_update: :cascade, on_delete: :cascade
end
