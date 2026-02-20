# frozen_string_literal: true

# =========================
# BASIC ORDER
# =========================

# Example 1: Ascending (default)
users = User.order(:created_at)
# SQL: ORDER BY "users"."created_at" ASC

# Example 2: Descending
users = User.order(created_at: :desc)

# Example 3: Multiple columns
users = User.order(:last_name, :first_name)

# Example 4: Mixed directions
users = User.order(last_name: :asc, created_at: :desc)


# =========================
# RAW SQL ORDER
# =========================

# Example 5: SQL fragment
users = User.order("LOWER(email) ASC")

# Example 6: NULLS LAST (PostgreSQL)
users = User.order("created_at DESC NULLS LAST")


# =========================
# CHAINING
# =========================

# Example 7: With where
users = User.where(active: true)
            .order(:created_at)

# Example 8: With limit
users = User.order(:created_at)
            .limit(10)

# Example 9: With offset (pagination)
users = User.order(:created_at)
            .offset(20)
            .limit(10)


# =========================
# REORDER
# =========================

# Example 10: reorder overrides previous order
users = User.order(:name)
            .reorder(:created_at)

# Example 11: unscope removes order
users = User.order(:name)
            .unscope(:order)


# =========================
# ASSOCIATIONS
# =========================

# Example 12: order on joined table
users = User.joins(:posts)
            .order("posts.created_at DESC")

# Example 13: order with includes
users = User.includes(:profile)
            .order("profiles.last_name ASC")


# =========================
# EXECUTION
# =========================

# Example 14: Lazy evaluation
relation = User.order(:created_at)
puts relation.class
# => ActiveRecord::Relation

# Example 15: Query runs here
users = User.order(:created_at).to_a


# =========================
# CONDITIONAL ORDER
# =========================

# Example 16: Dynamic direction
direction = %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
users = User.order("created_at #{direction}")

# =========================
# COMMON MISTAKE
# =========================

# ❌ Loads everything and sorts in Ruby (bad for large tables)
users = User.all.to_a.sort_by(&:created_at)

# ✅ Correct — sorting in database
users = User.order(:created_at)
