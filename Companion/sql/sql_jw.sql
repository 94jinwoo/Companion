-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: companion
-- Source Schemata: companion
-- Created: Tue Apr 21 14:18:57 2020
-- Workbench Version: 8.0.19
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema companion
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `companion` ;
CREATE SCHEMA IF NOT EXISTS `companion` ;

-- ----------------------------------------------------------------------------
-- Table companion.article
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`article` (
  `board_id` INT(11) NOT NULL COMMENT '게시판ID',
  `article_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '게시글ID',
  `member_id` VARCHAR(20) NOT NULL COMMENT '회원ID',
  `article_title` VARCHAR(50) NOT NULL COMMENT '게시글제목',
  `article_content` TEXT NOT NULL COMMENT '게시글내용',
  `article_date` DATETIME NOT NULL COMMENT '게시글작성일',
  `article_count` INT(11) NOT NULL COMMENT '게시글조회수',
  `article_image` VARCHAR(200) NULL DEFAULT NULL COMMENT '게시글이미지',
  `article_thumb` VARCHAR(200) NULL DEFAULT NULL,
  `product_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`article_id`, `board_id`, `member_id`),
  INDEX `FK_board_article_1` (`board_id` ASC),
  INDEX `FK_member_article_2` (`member_id` ASC),
  INDEX `FK_product_article_3_idx` (`product_id` ASC),
  CONSTRAINT `FK_board_article_1`
    FOREIGN KEY (`board_id`)
    REFERENCES `companion`.`board` (`board_id`),
  CONSTRAINT `FK_member_article_2`
    FOREIGN KEY (`member_id`)
    REFERENCES `companion`.`member` (`member_id`),
  CONSTRAINT `FK_product_article_3`
    FOREIGN KEY (`product_id`)
    REFERENCES `companion`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1161
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table companion.board
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`board` (
  `board_id` INT(11) NOT NULL COMMENT '게시판ID',
  `board_type` VARCHAR(20) NOT NULL COMMENT '게시판종류',
  PRIMARY KEY (`board_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table companion.cart
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`cart` (
  `cart_id` INT(11) NOT NULL COMMENT '장바구니ID',
  `member_id` VARCHAR(20) NOT NULL COMMENT '회원ID',
  `product_id` INT(11) NOT NULL COMMENT '상품ID',
  `cart_quantity` INT(11) NOT NULL DEFAULT '1' COMMENT '장바구니수량',
  `cart_option` VARCHAR(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cart_id`, `product_id`, `member_id`),
  INDEX `FK_product_cart_1` (`product_id` ASC),
  INDEX `FK_member_cart_2` (`member_id` ASC),
  CONSTRAINT `FK_member_cart_2`
    FOREIGN KEY (`member_id`)
    REFERENCES `companion`.`member` (`member_id`),
  CONSTRAINT `FK_product_cart_1`
    FOREIGN KEY (`product_id`)
    REFERENCES `companion`.`product` (`product_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table companion.category
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`category` (
  `category_id` INT(11) NOT NULL COMMENT '분류ID',
  `category_refid` INT(11) NULL DEFAULT NULL COMMENT '분류참조ID',
  `category_name` VARCHAR(20) NOT NULL COMMENT '분류이름',
  PRIMARY KEY (`category_id`),
  INDEX `FK_category_category` (`category_refid` ASC),
  CONSTRAINT `FK_category_category`
    FOREIGN KEY (`category_refid`)
    REFERENCES `companion`.`category` (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table companion.comment
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`comment` (
  `article_id` INT(11) NOT NULL COMMENT '게시글ID',
  `comment_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '댓글ID',
  `member_id` VARCHAR(20) NOT NULL COMMENT '회원ID',
  `comment_content` TEXT NOT NULL COMMENT '댓글내용',
  `comment_date` DATETIME NOT NULL COMMENT '댓글작성일',
  `comment_groupnum` INT(11) NOT NULL COMMENT '댓글그룹번호',
  `comment_groupord` INT(11) NOT NULL COMMENT '댓글그룹순서',
  `comment_depth` INT(11) NOT NULL COMMENT '댓글깊이',
  PRIMARY KEY (`comment_id`, `article_id`, `member_id`),
  INDEX `FK_article_comment_1` (`article_id` ASC),
  INDEX `FK_member_comment_2` (`member_id` ASC),
  CONSTRAINT `FK_article_comment_1`
    FOREIGN KEY (`article_id`)
    REFERENCES `companion`.`article` (`article_id`),
  CONSTRAINT `FK_member_comment_2`
    FOREIGN KEY (`member_id`)
    REFERENCES `companion`.`member` (`member_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table companion.coupon
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`coupon` (
  `coupon_id` INT(11) NOT NULL COMMENT '쿠폰ID',
  `coupon_name` VARCHAR(20) NOT NULL COMMENT '쿠폰이름',
  `coupon_enddate` DATETIME NOT NULL COMMENT '쿠폰기한',
  `coupon_sale` INT(11) NOT NULL COMMENT '쿠폰할인율',
  PRIMARY KEY (`coupon_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table companion.coupon_list
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`coupon_list` (
  `coupon_list` INT(11) NOT NULL AUTO_INCREMENT COMMENT '쿠폰목록ID',
  `coupon_id` INT(11) NOT NULL COMMENT '쿠폰ID',
  `member_id` VARCHAR(20) NOT NULL COMMENT '회원ID',
  `coupon_state_id` INT(11) NOT NULL DEFAULT '0' COMMENT '쿠폰상태ID',
  PRIMARY KEY (`coupon_list`, `coupon_state_id`, `coupon_id`, `member_id`),
  INDEX `FK_coupon_coupon_list_1` (`coupon_id` ASC),
  INDEX `FK_coupon_state_coupon_list_2` (`coupon_state_id` ASC),
  INDEX `FK_member_coupon_list_3` (`member_id` ASC),
  CONSTRAINT `FK_coupon_coupon_list_1`
    FOREIGN KEY (`coupon_id`)
    REFERENCES `companion`.`coupon` (`coupon_id`),
  CONSTRAINT `FK_coupon_state_coupon_list_2`
    FOREIGN KEY (`coupon_state_id`)
    REFERENCES `companion`.`coupon_state` (`coupon_state_id`),
  CONSTRAINT `FK_member_coupon_list_3`
    FOREIGN KEY (`member_id`)
    REFERENCES `companion`.`member` (`member_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table companion.coupon_state
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`coupon_state` (
  `coupon_state_id` INT(11) NOT NULL COMMENT '쿠폰상태ID',
  `coupon_state_name` VARCHAR(20) NOT NULL COMMENT '쿠폰상태이름',
  PRIMARY KEY (`coupon_state_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table companion.delivery
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`delivery` (
  `delivery_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '택배ID',
  `order_id` INT(11) NOT NULL COMMENT '주문ID',
  `member_id` VARCHAR(20) NOT NULL COMMENT '회원ID',
  `delivery_company` VARCHAR(20) NOT NULL COMMENT '배송택배회사',
  `delivery_number` VARCHAR(30) NOT NULL COMMENT '배송송장번호',
  `delivery_state_id` INT(11) NOT NULL DEFAULT '0' COMMENT '택배상태ID',
  PRIMARY KEY (`delivery_id`, `delivery_state_id`, `order_id`, `member_id`),
  INDEX `FK_order_delivery_1` (`order_id` ASC),
  INDEX `FK_member_delivery_2` (`member_id` ASC),
  INDEX `FK_delivery_state_delivery_3` (`delivery_state_id` ASC),
  CONSTRAINT `FK_delivery_state_delivery_3`
    FOREIGN KEY (`delivery_state_id`)
    REFERENCES `companion`.`delivery_state` (`delivery_state_id`),
  CONSTRAINT `FK_member_delivery_2`
    FOREIGN KEY (`member_id`)
    REFERENCES `companion`.`member` (`member_id`),
  CONSTRAINT `FK_order_delivery_1`
    FOREIGN KEY (`order_id`)
    REFERENCES `companion`.`order` (`order_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 91
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table companion.delivery_state
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`delivery_state` (
  `delivery_state_id` INT(11) NOT NULL COMMENT '배송상태ID',
  `delivery_state_name` VARCHAR(20) NOT NULL COMMENT '배송상태이름',
  PRIMARY KEY (`delivery_state_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table companion.grade
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`grade` (
  `grade_id` INT(11) NOT NULL COMMENT '회원등급ID',
  `grade_name` VARCHAR(20) NOT NULL COMMENT '회원등급이름',
  PRIMARY KEY (`grade_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table companion.like
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`like` (
  `like_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '좋아요ID',
  `member_id` VARCHAR(20) NOT NULL COMMENT '회원ID',
  `product_id` INT(11) NOT NULL COMMENT '상품ID',
  PRIMARY KEY (`like_id`, `product_id`, `member_id`),
  INDEX `FK_product_like_1` (`product_id` ASC),
  INDEX `FK_member_like_2` (`member_id` ASC),
  CONSTRAINT `FK_member_like_2`
    FOREIGN KEY (`member_id`)
    REFERENCES `companion`.`member` (`member_id`),
  CONSTRAINT `FK_product_like_1`
    FOREIGN KEY (`product_id`)
    REFERENCES `companion`.`product` (`product_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 252
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table companion.member
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`member` (
  `member_id` VARCHAR(20) NOT NULL COMMENT '회원ID',
  `member_pw` VARCHAR(30) NOT NULL COMMENT '회원PW',
  `member_name` VARCHAR(10) NOT NULL COMMENT '회원이름',
  `member_tel` VARCHAR(13) NULL DEFAULT NULL COMMENT '회원일반전화',
  `member_phone` VARCHAR(13) NOT NULL COMMENT '회원휴대전화',
  `member_email` VARCHAR(50) NOT NULL COMMENT '회원이메일',
  `member_addr1` VARCHAR(20) NOT NULL COMMENT '회원주소1',
  `member_addr2` VARCHAR(100) NOT NULL COMMENT '회원주소2',
  `member_addr3` VARCHAR(100) NOT NULL COMMENT '회원주소3',
  `member_grade` INT(11) NOT NULL DEFAULT '2' COMMENT '회원등급',
  PRIMARY KEY (`member_id`, `member_grade`),
  INDEX `FK_grade_member` (`member_grade` ASC),
  CONSTRAINT `FK_grade_member`
    FOREIGN KEY (`member_grade`)
    REFERENCES `companion`.`grade` (`grade_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table companion.order
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`order` (
  `order_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '주문ID',
  `member_id` VARCHAR(20) NOT NULL COMMENT '회원ID',
  `order_date` DATETIME NOT NULL COMMENT '주문일',
  `order_amount` INT(11) NOT NULL COMMENT '주문총가격',
  `order_name` VARCHAR(10) NOT NULL COMMENT '주문수령인',
  `order_tel` VARCHAR(13) NULL DEFAULT NULL COMMENT '주문수령인일반전화',
  `order_phone` VARCHAR(13) NOT NULL COMMENT '주문수령인휴대전화',
  `order_addr1` VARCHAR(20) NOT NULL COMMENT '주문주소1',
  `order_addr2` VARCHAR(100) NOT NULL COMMENT '주문주소2',
  `order_addr3` VARCHAR(100) NOT NULL COMMENT '주문주소3',
  `order_msg` VARCHAR(100) NULL DEFAULT NULL COMMENT '주문배송메세지',
  `order_state_id` INT(11) NOT NULL DEFAULT '0' COMMENT '주문상태ID',
  PRIMARY KEY (`order_id`, `member_id`, `order_state_id`),
  INDEX `FK_member_order_1` (`member_id` ASC),
  INDEX `FK_order_state_order_2` (`order_state_id` ASC),
  CONSTRAINT `FK_member_order_1`
    FOREIGN KEY (`member_id`)
    REFERENCES `companion`.`member` (`member_id`),
  CONSTRAINT `FK_order_state_order_2`
    FOREIGN KEY (`order_state_id`)
    REFERENCES `companion`.`order_state` (`order_state_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 183
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table companion.order_detail
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`order_detail` (
  `order_detail_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '주문상세ID',
  `order_id` INT(11) NOT NULL COMMENT '주문ID',
  `product_id` INT(11) NOT NULL COMMENT '상품ID',
  `order_detail_price` INT(11) NOT NULL COMMENT '주문상세가격',
  `order_detail_quantity` INT(11) NOT NULL COMMENT '주문상세수량',
  `order_detail_option` VARCHAR(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`order_detail_id`, `product_id`, `order_id`),
  INDEX `FK_product_order_detail_1` (`product_id` ASC),
  INDEX `FK_order_order_detail_2` (`order_id` ASC),
  CONSTRAINT `FK_order_order_detail_2`
    FOREIGN KEY (`order_id`)
    REFERENCES `companion`.`order` (`order_id`),
  CONSTRAINT `FK_product_order_detail_1`
    FOREIGN KEY (`product_id`)
    REFERENCES `companion`.`product` (`product_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 109
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table companion.order_state
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`order_state` (
  `order_state_id` INT(11) NOT NULL COMMENT '주문상태ID',
  `order_state_member` VARCHAR(20) NOT NULL COMMENT '주문상태이름회원',
  `order_state_admin` VARCHAR(20) NOT NULL COMMENT '주문상태이름관리자',
  PRIMARY KEY (`order_state_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table companion.payment
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`payment` (
  `payment_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '결제ID',
  `order_id` INT(11) NOT NULL COMMENT '주문ID',
  `member_id` VARCHAR(20) NOT NULL COMMENT '회원ID',
  `payment_date` DATETIME NOT NULL COMMENT '결제일',
  `payment_amount` INT(11) NOT NULL COMMENT '결제금액',
  `payment_state_id` INT(11) NOT NULL DEFAULT '0' COMMENT '결제상태ID',
  PRIMARY KEY (`payment_id`, `payment_state_id`, `order_id`, `member_id`),
  INDEX `FK_payment_state_payment_2` (`payment_state_id` ASC),
  INDEX `FK_order_payment_3` (`order_id` ASC),
  INDEX `FK_member_payment_4` (`member_id` ASC),
  CONSTRAINT `FK_member_payment_4`
    FOREIGN KEY (`member_id`)
    REFERENCES `companion`.`member` (`member_id`),
  CONSTRAINT `FK_order_payment_3`
    FOREIGN KEY (`order_id`)
    REFERENCES `companion`.`order` (`order_id`),
  CONSTRAINT `FK_payment_state_payment_2`
    FOREIGN KEY (`payment_state_id`)
    REFERENCES `companion`.`payment_state` (`payment_state_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 148
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table companion.payment_state
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`payment_state` (
  `payment_state_id` INT(11) NOT NULL COMMENT '결제상태ID',
  `payment_state_name` VARCHAR(20) NOT NULL COMMENT '결제상태이름',
  PRIMARY KEY (`payment_state_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table companion.point
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`point` (
  `point_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '적립금ID',
  `point_money` INT(11) NOT NULL COMMENT '적립차감금액',
  `point_date` DATETIME NOT NULL COMMENT '적립차감일',
  PRIMARY KEY (`point_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table companion.point_list
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`point_list` (
  `point_list_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '적립금목록ID',
  `point_id` INT(11) NOT NULL COMMENT '적립금ID',
  `member_id` VARCHAR(20) NOT NULL COMMENT '회원ID',
  `point_state_id` INT(11) NOT NULL COMMENT '적립금상태ID',
  `point_list_sum` INT(11) NOT NULL DEFAULT '0' COMMENT '보유적립금',
  PRIMARY KEY (`point_list_id`, `member_id`, `point_id`, `point_state_id`),
  INDEX `FK_member_point_list_1` (`member_id` ASC),
  INDEX `FK_point_point_list_2` (`point_id` ASC),
  INDEX `FK_point_state_point_list_3` (`point_state_id` ASC),
  CONSTRAINT `FK_member_point_list_1`
    FOREIGN KEY (`member_id`)
    REFERENCES `companion`.`member` (`member_id`),
  CONSTRAINT `FK_point_point_list_2`
    FOREIGN KEY (`point_id`)
    REFERENCES `companion`.`point` (`point_id`),
  CONSTRAINT `FK_point_state_point_list_3`
    FOREIGN KEY (`point_state_id`)
    REFERENCES `companion`.`point_state` (`point_state_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table companion.point_state
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`point_state` (
  `point_state_id` INT(11) NOT NULL COMMENT '적립금상태ID',
  `point_state_name` VARCHAR(20) NULL DEFAULT NULL COMMENT '적립금상태이름',
  PRIMARY KEY (`point_state_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table companion.product
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`product` (
  `category_id` INT(11) NOT NULL COMMENT '분류ID',
  `product_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '상품ID',
  `product_name` VARCHAR(50) NOT NULL COMMENT '상품이름',
  `product_content` TEXT NULL DEFAULT NULL COMMENT '상품설명',
  `product_price` INT(11) NOT NULL COMMENT '상품가격',
  `product_stock` INT(11) NOT NULL COMMENT '상품재고',
  `product_date` DATETIME NOT NULL COMMENT '상품등록일',
  `product_image` VARCHAR(200) NULL DEFAULT NULL COMMENT '상품이미지',
  `product_thumb` VARCHAR(200) NULL DEFAULT NULL COMMENT '상품섬네일',
  `product_option1` VARCHAR(50) NULL DEFAULT NULL COMMENT '상품옵션1',
  `product_option2` VARCHAR(50) NULL DEFAULT NULL COMMENT '상품옵션2',
  `product_option3` VARCHAR(50) NULL DEFAULT NULL COMMENT '상품옵션3',
  `product_option4` VARCHAR(50) NULL DEFAULT NULL COMMENT '상품옵션4',
  `product_option5` VARCHAR(50) NULL DEFAULT NULL COMMENT '상품옵션5',
  PRIMARY KEY (`product_id`, `category_id`),
  INDEX `FK_category_product` (`category_id` ASC),
  CONSTRAINT `FK_category_product`
    FOREIGN KEY (`category_id`)
    REFERENCES `companion`.`category` (`category_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1515
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table companion.question
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`question` (
  `question_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '문의ID',
  `question_type_id` INT(11) NOT NULL COMMENT '문의유형ID',
  `order_id` INT(11) NULL DEFAULT NULL COMMENT '주문ID',
  `product_id` INT(11) NULL DEFAULT NULL COMMENT '상품ID',
  `member_id` VARCHAR(20) NOT NULL COMMENT '회원ID',
  `question_date` DATETIME NOT NULL COMMENT '문의신청일',
  `question_answerdate` DATETIME NULL DEFAULT NULL COMMENT '문의답변일',
  `question_title` VARCHAR(50) NOT NULL COMMENT '문의제목',
  `question_content` TEXT NOT NULL COMMENT '문의내용',
  `question_image` VARCHAR(200) NULL DEFAULT NULL COMMENT '문의이미지',
  `question_answer` TEXT NULL DEFAULT NULL COMMENT '문의답변내용',
  `question_secret_id` INT(11) NOT NULL DEFAULT '0' COMMENT '문의비밀글id',
  `question_state_id` INT(11) NOT NULL DEFAULT '0' COMMENT '문의상태ID',
  PRIMARY KEY (`question_id`, `member_id`, `question_state_id`, `question_type_id`, `question_secret_id`),
  INDEX `FK_member_question_1` (`member_id` ASC),
  INDEX `FK_question_state_question_2` (`question_state_id` ASC),
  INDEX `FK_question_type_question_3` (`question_type_id` ASC),
  INDEX `FK_order_question_4` (`order_id` ASC),
  INDEX `FK_question_secret_question_5` (`question_secret_id` ASC),
  INDEX `FK_product_question_6` (`product_id` ASC),
  CONSTRAINT `FK_member_question_1`
    FOREIGN KEY (`member_id`)
    REFERENCES `companion`.`member` (`member_id`),
  CONSTRAINT `FK_order_question_4`
    FOREIGN KEY (`order_id`)
    REFERENCES `companion`.`order` (`order_id`),
  CONSTRAINT `FK_product_question_6`
    FOREIGN KEY (`product_id`)
    REFERENCES `companion`.`product` (`product_id`),
  CONSTRAINT `FK_question_secret_question_5`
    FOREIGN KEY (`question_secret_id`)
    REFERENCES `companion`.`question_secret` (`question_secret_id`),
  CONSTRAINT `FK_question_state_question_2`
    FOREIGN KEY (`question_state_id`)
    REFERENCES `companion`.`question_state` (`question_state_id`),
  CONSTRAINT `FK_question_type_question_3`
    FOREIGN KEY (`question_type_id`)
    REFERENCES `companion`.`question_type` (`question_type_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 570
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table companion.question_secret
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`question_secret` (
  `question_secret_id` INT(11) NOT NULL COMMENT '문의비밀글id',
  `question_secret_name` VARCHAR(20) NOT NULL COMMENT '문의비밀글여부',
  PRIMARY KEY (`question_secret_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table companion.question_state
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`question_state` (
  `question_state_id` INT(11) NOT NULL COMMENT '문의상태ID',
  `question_state_name` VARCHAR(20) NOT NULL COMMENT '문의상태이름',
  PRIMARY KEY (`question_state_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table companion.question_type
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`question_type` (
  `question_type_id` INT(11) NOT NULL COMMENT '문의유형ID',
  `question_type_name` VARCHAR(20) NOT NULL COMMENT '문의유형이름',
  PRIMARY KEY (`question_type_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table companion.reserve
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`reserve` (
  `reserve_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '예약ID',
  `member_id` VARCHAR(20) NOT NULL COMMENT '회원ID',
  `service_id` INT(11) NOT NULL COMMENT '서비스ID',
  `reserve_date` DATETIME NOT NULL COMMENT '예약일',
  `reserve_checkin` DATETIME NOT NULL COMMENT '예약입실일',
  `reserve_checkout` DATETIME NOT NULL COMMENT '예약퇴실일',
  `reserve_dogtype` VARCHAR(20) NULL DEFAULT NULL COMMENT '예약반려견종',
  `reserve_dogage` INT(11) NULL DEFAULT NULL COMMENT '예약반려견나이',
  `reserve_msg` TEXT NULL DEFAULT NULL COMMENT '예약메세지',
  `reserve_state_id` INT(11) NOT NULL DEFAULT '0' COMMENT '예약상태ID',
  PRIMARY KEY (`reserve_id`, `service_id`, `reserve_state_id`, `member_id`),
  INDEX `FK_reserve_state_reserve_1` (`reserve_state_id` ASC),
  INDEX `FK_service_reserve_2` (`service_id` ASC),
  INDEX `FK_member_reserve_3` (`member_id` ASC),
  CONSTRAINT `FK_member_reserve_3`
    FOREIGN KEY (`member_id`)
    REFERENCES `companion`.`member` (`member_id`),
  CONSTRAINT `FK_reserve_state_reserve_1`
    FOREIGN KEY (`reserve_state_id`)
    REFERENCES `companion`.`reserve_state` (`reserve_state_id`),
  CONSTRAINT `FK_service_reserve_2`
    FOREIGN KEY (`service_id`)
    REFERENCES `companion`.`service` (`service_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 34
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table companion.reserve_state
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`reserve_state` (
  `reserve_state_id` INT(11) NOT NULL COMMENT '예약상태ID',
  `reserve_state_name` VARCHAR(20) NOT NULL COMMENT '예약상태명',
  PRIMARY KEY (`reserve_state_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- ----------------------------------------------------------------------------
-- Table companion.service
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `companion`.`service` (
  `service_id` INT(11) NOT NULL COMMENT '서비스ID',
  `service_name` VARCHAR(20) NOT NULL COMMENT '서비스명',
  PRIMARY KEY (`service_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
SET FOREIGN_KEY_CHECKS = 1;
