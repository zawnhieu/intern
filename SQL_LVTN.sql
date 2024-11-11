

-- Bảng addresses
CREATE TABLE addresses (
  id BIGINT NOT NULL IDENTITY(1,1),
  user_id BIGINT NOT NULL,
  city NVARCHAR(255) NOT NULL,
  district NVARCHAR(255) NOT NULL,
  ward NVARCHAR(255) NOT NULL,
  apartment_number NVARCHAR(255) NOT NULL,
  created_at DATETIME NULL,
  updated_at DATETIME NULL,
  deleted_at DATETIME NULL,
  PRIMARY KEY (id)
);

-- Bảng brands
CREATE TABLE brands (
  id BIGINT NOT NULL IDENTITY(1,1),
  name NVARCHAR(50) NOT NULL,
  created_at DATETIME NULL,
  updated_at DATETIME NULL,
  deleted_at DATETIME NULL,
  PRIMARY KEY (id)
);

-- Bảng categories
CREATE TABLE categories (
  id BIGINT NOT NULL IDENTITY(1,1),
  name NVARCHAR(100) NOT NULL,
  created_at DATETIME NULL,
  updated_at DATETIME NULL,
  deleted_at DATETIME NULL,
  parent_id INT NOT NULL,
  slug NVARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

-- Bảng colors
CREATE TABLE colors (
  id BIGINT NOT NULL IDENTITY(1,1),
  name NVARCHAR(50) NOT NULL,
  created_at DATETIME NULL,
  updated_at DATETIME NULL,
  deleted_at DATETIME NULL,
  PRIMARY KEY (id)
);

-- Bảng orders
CREATE TABLE orders (
  id BIGINT NOT NULL IDENTITY(1,1),
  user_id BIGINT NOT NULL,
  payment_id BIGINT NOT NULL,
  total_money FLOAT NOT NULL,
  order_status INT NOT NULL DEFAULT 0,
  created_at DATETIME NULL,
  updated_at DATETIME NULL,
  deleted_at DATETIME NULL,
  transport_fee FLOAT NOT NULL,
  note NVARCHAR(255) NULL,
  payment_status INT NOT NULL DEFAULT 0,
  PRIMARY KEY (id)
);

-- Bảng order_details
CREATE TABLE order_details (
  id BIGINT NOT NULL IDENTITY(1,1),
  order_id BIGINT NOT NULL,
  product_size_id BIGINT NOT NULL,
  unit_price FLOAT NOT NULL,
  quantity INT NOT NULL,
  created_at DATETIME NULL,
  updated_at DATETIME NULL,
  PRIMARY KEY (id)
);

-- Bảng payments
CREATE TABLE payments (
  id BIGINT NOT NULL IDENTITY(1,1),
  name NVARCHAR(50) NOT NULL,
  created_at DATETIME NULL,
  updated_at DATETIME NULL,
  deleted_at DATETIME NULL,
  status INT NOT NULL,
  img NVARCHAR(MAX) NOT NULL,
  PRIMARY KEY (id)
);

-- Bảng products
CREATE TABLE products (
  id BIGINT NOT NULL IDENTITY(1,1),
  name NVARCHAR(100) NOT NULL,
  price_import FLOAT NOT NULL,
  price_sell FLOAT NOT NULL,
  img NVARCHAR(255) NOT NULL,
  description NVARCHAR(MAX) NOT NULL,
  status INT NOT NULL DEFAULT 1,
  category_id BIGINT NOT NULL,
  brand_id BIGINT NOT NULL,
  created_at DATETIME NULL,
  updated_at DATETIME NULL,
  deleted_at DATETIME NULL,
  PRIMARY KEY (id)
);

-- Bảng products_color
CREATE TABLE products_color (
  id BIGINT NOT NULL IDENTITY(1,1),
  img NVARCHAR(255) NOT NULL,
  color_id BIGINT NOT NULL,
  product_id BIGINT NOT NULL,
  created_at DATETIME NULL,
  updated_at DATETIME NULL,
  deleted_at DATETIME NULL,
  PRIMARY KEY (id)
);

-- Bảng products_size
CREATE TABLE products_size (
  id BIGINT NOT NULL IDENTITY(1,1),
  product_color_id BIGINT NOT NULL,
  size_id BIGINT NOT NULL,
  created_at DATETIME NULL,
  updated_at DATETIME NULL,
  quantity INT NOT NULL,
  deleted_at DATETIME NULL,
  PRIMARY KEY (id)
);

-- Bảng product_reviews
CREATE TABLE product_reviews (
  id BIGINT NOT NULL IDENTITY(1,1),
  user_id BIGINT NOT NULL,
  product_id BIGINT NOT NULL,
  rating INT NOT NULL,
  content NVARCHAR(255) NOT NULL,
  created_at DATETIME NULL,
  updated_at DATETIME NULL,
  deleted_at DATETIME NULL,
  PRIMARY KEY (id)
);

-- Bảng roles
CREATE TABLE roles (
  id BIGINT NOT NULL IDENTITY(1,1),
  name NVARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

-- Bảng setting
CREATE TABLE setting (
  id BIGINT NOT NULL IDENTITY(1,1),
  logo NVARCHAR(255) NOT NULL,
  name NVARCHAR(100) NOT NULL,
  email NVARCHAR(100) NOT NULL,
  address NVARCHAR(255) NOT NULL,
  phone_number NVARCHAR(20) NOT NULL,
  maintenance INT NOT NULL,
  notification NVARCHAR(MAX) NOT NULL,
  introduction NVARCHAR(MAX) NOT NULL,
  created_at DATETIME NULL,
  updated_at DATETIME NULL,
  PRIMARY KEY (id)
);

-- Bảng sizes
CREATE TABLE sizes (
  id BIGINT NOT NULL IDENTITY(1,1),
  name NVARCHAR(50) NOT NULL,
  created_at DATETIME NULL,
  updated_at DATETIME NULL,
  deleted_at DATETIME NULL,
  PRIMARY KEY (id)
);

-- Bảng users
CREATE TABLE users (
  id BIGINT NOT NULL IDENTITY(1,1),
  name NVARCHAR(255) NOT NULL,
  email NVARCHAR(255) NULL,
  password NVARCHAR(255) NULL,
  email_verified_at DATETIME NULL,
  phone_number NVARCHAR(255) NOT NULL,
  role_id BIGINT NOT NULL,
  active INT NOT NULL DEFAULT 1,
  disable_reason NVARCHAR(255) NULL,
  created_by INT NULL,
  updated_by INT NULL,
  deleted_by INT NULL,
  remember_token NVARCHAR(100) NULL,
  created_at DATETIME NULL,
  updated_at DATETIME NULL,
  deleted_at DATETIME NULL,
  PRIMARY KEY (id)
);

-- Bảng user_verifies
CREATE TABLE user_verifies (
  id BIGINT NOT NULL IDENTITY(1,1),
  user_id INT NOT NULL,
  token VARCHAR(255) NULL,
  expires_at DATETIME NULL,
  email_verify NVARCHAR(255) NULL,
  created_at DATETIME NULL,
  updated_at DATETIME NULL,
  deleted_at DATETIME NULL,
  PRIMARY KEY (id)
);

ALTER TABLE addresses ADD FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE orders ADD FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE orders ADD FOREIGN KEY (payment_id) REFERENCES payments(id);
ALTER TABLE order_details ADD FOREIGN KEY (order_id) REFERENCES orders(id);
ALTER TABLE order_details ADD FOREIGN KEY (product_size_id) REFERENCES products_size(id);
ALTER TABLE products ADD FOREIGN KEY (category_id) REFERENCES categories(id);
ALTER TABLE products ADD FOREIGN KEY (brand_id) REFERENCES brands(id);
ALTER TABLE products_color ADD FOREIGN KEY (product_id) REFERENCES products(id);
ALTER TABLE products_color ADD FOREIGN KEY (color_id) REFERENCES colors(id);
ALTER TABLE products_size ADD FOREIGN KEY (product_color_id) REFERENCES products_color(id);
ALTER TABLE products_size ADD FOREIGN KEY (size_id) REFERENCES sizes(id);
ALTER TABLE product_reviews ADD FOREIGN KEY (product_id) REFERENCES products(id);
ALTER TABLE product_reviews ADD FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE users ADD FOREIGN KEY (role_id) REFERENCES roles(id);

