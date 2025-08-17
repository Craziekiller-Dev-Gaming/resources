if (Lang == undefined) {
	var Lang = [];
}
Lang["zh-cn"] = {
  common: {
    confirm: "确认",
    weight_unit: "kg",
    level_abbreviate: "Lvl.",
    skill_point: "技能点",
    areas: {
      sea: "海洋",
      lake: "湖泊",
      river: "河流",
      swamp: "沼泽",
      all: "全部",
    },
  },
  sidebar: {
    profile: "个人主页",
    bank: "储蓄账户",
    deliveries: "特别交付",
    dives: "潜水任务",
    upgrades: "技能升级",
    equipments: "捕鱼装备",
    store: "自营商店",
    owned_vehicles: "持有载具",
    owned_property: "自有房产",
    guide: "捕鱼指南",
    close: "关闭",
    property: "捕鱼资产",
    fish_store: "生鲜商店",
  },
  modals: {
    confirmation: {
      sell_vehicle: "您确定要出售此载具吗?",
      sell_propertty: "您确定要出售这处房产吗?仓库中的所有物品都将丢失",
      loan_payoff: "您确定要支付 {0} 的全部余额吗?",
      sell_all_fishes: "此操作将出售您背包中的所有鱼类. 您确定要继续?",
    },
  },
  statistics_page: {
    title: "个人数据",
    desc: "跟踪您的钓鱼生活进展的统计数据",
    money_earned: "总收入",
    money_spent: "总支出",
    total_mythic_fish: "捕获的神话鱼总数",
    total_legendary_fish: "捕获的传说鱼总数",
    total_all_fish: "捕获的鱼类总数",
    total_dives: "完成的潜水总数",
    total_deliveries: "完成的交付总数",
    total_exp: "获得的总经验",
    total_upgrades: "购买的总升级",
    top_users: {
      title: "钓鱼达人",
      desc: "城市中的前10名钓鱼达人",
      fishes_caught: "捕获的鱼类: {0}",
      exp: "经验: {0}",
    },
  },
  deliveries_page: {
    title: "特别交付",
    desc: "完成订单以获得特殊鱼类价格.选择一个合同开始, 并将请求的鱼类交付给客户",
    contracts_time: "每 {0} 分钟更新新合同",
    reward: "奖励",
    required_items: "所需物品",
    start_button: "开始合同",
    cancel_button: "取消合同",
    see_location: "查看位置",
    missing_item: "您没有这个物品",
  },
  dives_page: {
    start_button: "开始潜水",
    cancel_button: "取消潜水",
    title: "潜水任务",
    desc: "完成水下探险以寻找宝藏和稀有物品.选择一个潜水任务开始, 赚取独特的奖励, 但请注意, 宝藏箱的位置在您的GPS上不准确, 即使是最有经验的潜水员也会面临挑战",
    time: "每 {0} 分钟更新新潜水任务",
  },
  bank_page: {
    title: "储蓄账户",
    desc: "在此查看您捕鱼公司储蓄账户账户信息",
    withdraw: "取款",
    deposit: "存款",
    balance: "您的余额为:",
    active_loans: "活跃贷款",

    loan_title: "贷款",
    loan_desc: "申请贷款以投资您的业务！<BR>(最高贷款额: {0})",
    loan_button: "申请贷款",
    loan_value_title: "贷款金额",
    loan_daily_title: "每日费用",
    loan_remaining_title: "剩余金额",
    loan_date_title: "下次付款（自动扣款）",
    loan_pay: "还清贷款",

    loan_modal_desc: "选择一种贷款类型:",
    loan_modal_item: "({0}% 利率, {1} 天还款)",
    loan_modal_submit: "申请贷款",

    deposit_modal_title: "存款",
    deposit_modal_desc: "您想存入多少金额？",
    deposit_modal_submit: "存入金额",

    withdraw_modal_title: "取款",
    withdraw_modal_desc: "您想取出多少金额？",
    withdraw_modal_submit: "取出金额",

    modal_placeholder: "金额",
    modal_money_available: "可用金额: {0}",
    modal_cancel: "取消",
  },
  upgrades_page: {
    title: "技能升级",
    desc: "使用您的累积技能点解锁新能力，提升您的钓鱼体验.多种技能可以让您成为更优秀的钓鱼者.",
    vehicles: {
      title: "车辆",
      desc: "升级您的车库容量以容纳更多用于运输鱼类的车辆.",
      level: "+{0} 个车库槽位<BR>+ 解锁新车辆购买",
    },
    boats: {
      title: "船只",
      desc: "升级您的码头容量以容纳更多用于运输鱼类的船只.",
      level: "+{0} 个码头槽位<BR>+ 解锁新船只购买",
    },
    properties: {
      title: "地产",
      desc: "解锁新的地产使其可购买.",
      level: "解锁新地产进行购买",
    },
    lake: {
      title: "湖泊",
      desc: "提升您的湖泊技能以捕获更多种类的鱼.",
      level: "解锁湖泊中的新鱼类",
    },
    river: {
      title: "河流",
      desc: "提升您的河流技能以捕获更多种类的鱼.",
      level: "解锁河流中的新鱼类",
    },
    swamp: {
      title: "沼泽",
      desc: "提升您的沼泽技能以捕获更多种类的鱼.",
      level: "解锁沼泽中的新鱼类",
    },
    sea: {
      title: "海洋",
      desc: "提升您的海洋技能以捕获更多种类的鱼.",
      level: "解锁海洋中的新鱼类",
    },
  },
  equipments_page: {
    title: "捕鱼装备",
    desc: "购买新的钓鱼装备以提高您的钓鱼技巧.改善反应时间、增加捕获稀有鱼类的机会，并减少咬钩等待时间.投资于装备以提高您的钓鱼效果和成功率.",
    name: "名称",
    price: "价格",
    bonus: "加成",
    amount: "数量",
    buy_button: "购买",
    unlock_text: "达到 <b>等级 {0}</b> 以解锁此装备",
    rod: {
      title: "鱼竿",
      desc: "升级您的鱼竿以增加捕获稀有鱼类的机会.",
    },
    reel: {
      title: "卷线器",
      desc: "升级您的卷线器以提高收线性能，加快收线速度.",
    },
    hook: {
      title: "鱼钩",
      desc: "升级您的钩子以增加钩鱼时的反应时间，使捕获更容易.",
    },
    line: {
      title: "钓线",
      desc: "此升级将使您的钓线更强，意味着更容易控制张力，捕获鱼类更快.",
    },
    bait: {
      title: "饵料",
      desc: "升级您的饵料以减少鱼咬钩的等待时间，让您更快开始钓鱼.",
    },
    other: {
      title: "其他",
      desc: "其他装备以提升您的钓鱼体验.",
    },
  },
  store_page: {
    title: "自营商店",
    desc: "购买车辆、船只和地产以提升您的交付能力.从各种选项中选择，提升您的效率，扩展您的业务.",
    buy_button: "购买",
    tabs: {
      vehicle: "车辆",
      boat: "船只",
      property: "地产",
    },
    vehicle: {
      name: "车辆",
      price: "价格",
      trunk: "载重",
    },
    property: {
      name: "地产",
      capacity: "容量",
      owned: "您已拥有此地产",
    },
  },
  owned_vehicles_page: {
    title: "持有载具",
    desc: "查看和管理您的车库，监控您的船只和车辆的状态及燃油水平。",
    vehicle_plate: "车牌:",
    unregistered: "空",
    distance: "里程表: {0} km",
    vehicle_condition: "车辆状态",
    vehicle_fuel: "燃油",
    repair: "修理 {0}",
    refuel: "加油 {0}",
    spawn: "生成车辆",
    sell: "出售",
    unlock_text: {
      vehicle: "将车辆车库升级至 <b>等级 {0}</b> 解锁此车辆",
      boat: "将船只车库升级至 <b>等级 {0}</b> 解锁此船只",
      property: "将地产技能升级至 <b>等级 {0}</b> 解锁此地产",
    },
    tabs: {
      vehicle: "车辆",
      boat: "船只",
    },
  },
  owned_properties_page: {
    title: "持有房产",
    desc: "在此管理您的地产。查看库存容量、状态，设置路线点，出售地产及修理损坏的地产以保持正常功能。",
    see: "查看地产库存",
    repair: "修理 {0}",
    sell: "出售地产",
    stock_percentage: "库存容量",
    stock_condition: "库存状态",
    address: "地址: {0}",
    set_waypoint: "设置路线点",
  },
  guide_page: {
    title: "捕鱼指南",
    desc: "旨在帮助钓鱼者了解每个地点的鱼类物种。",
    fish_weight: "重量",
    fish_value: "价值",
    filter_label: "按名称过滤",
    filter_placeholder: "鱼名",
  },
  stock_page: {
    title: "地产库存 ({0})",
    desc: "在这里您可以查看并管理您的地产存储的所有物品。",
    property_stock_title: "地产库存",
    player_inventory_title: "您的库存",
    table_empty: "库存为空",
    bar_title: "库存容量",
    inventory_table: {
      header_name: "物品名称",
      header_amount: "数量",
      header_weight: "重量",
      header_value: "价值",
    },
    deposit_modal_title: "存入物品",
    deposit_modal_item_available: "库存中: {0}",
    withdraw_modal_title: "提取物品",
    withdraw_modal_item_available: "库存中: {0}",
    withdraw_modal_amount: "数量",
    withdraw_modal_cancel: "取消",
  },
	tournaments: {
		join_tournament_alert: {
			title: "钓鱼比赛",
			body: "加入我们的钓鱼比赛，赢取丰厚奖励的机会！下一场比赛将在 <b>{0}</b> 的 <b>{1}</b> 开始。要参与，请在活动开始前点击“加入比赛”按钮。",
			footer: "准备好你的装备，争取捕获最大和最稀有的鱼以赢得最高奖项。不要错过赢取高达 <b>{0}</b> 的机会！",
			button: "加入比赛",
		},
		joined_tournament_alert: {
			title: "比赛报名确认",
			body: "你已成功报名参加即将到来的钓鱼比赛！比赛将在 <b>{0}</b> 的 <b>{1}</b> 开始，别忘了准时到达。",
			footer: "你已经准备好了！装备自己，争夺最高奖项并捕获最大和最稀有的鱼。奖品高达 <b>{0}</b> 等着你！",
			button: "在 GPS 上标记位置",
		},
		scoreboard_dialog: {
			title: "比赛积分榜",
			table_name: "参赛者",
			table_points: "积分",
		},
		join_tournament_dialog: {
			title: "加入钓鱼比赛",
			body: `
				<p>你即将参加钓鱼比赛。以下是比赛的详细信息：</p>

				<ul>
					<li><strong>比赛开始时间：</strong> {0} 在 {1}</li>
					<li><strong>入场费：</strong> {2}</li>
					<li><strong>持续时间：</strong> {3} 分钟</li>
				</ul>

				<p><strong>奖品：</strong></p>
				<ul>
					<li><strong>第一名：</strong> {4}</li>
					<li><strong>第二名：</strong> {5}</li>
					<li><strong>第三名：</strong> {6}</li>
				</ul>

				<p><strong>目标：</strong> 捕获尽可能多的鱼以提高你的总得分，稀有鱼的得分更高！ 🏆</p>

				<p>你准备好了吗？</p>`,
		},
		today_text: "今天",
		week_days: new Array("周日", "周一", "周二", "周三", "周四", "周五", "周六"),
	},
  fish_store_page: {
    desc: "在这里您可以按指定价格出售您的鱼类。使用过滤选项快速按名称查找特定鱼类或调整价格范围。为您的努力获得最佳价值，并保持库存的新鲜。",
    amount: "数量",
    sell_button: "出售鱼类",
    sell_all_button: "出售所有鱼类",
    filters: {
      title: "过滤器",
      name_placeholder: "按名称过滤",
      name: "名称:",
      price: "价格:",
      min: "最低:",
      max: "最高:",
      only_owned: "仅拥有的:",
      filter_btn: "筛选",
    },
    others_tab: "其他",
  },
  fishing_game: {
    get_ready: "准备好钩住鱼吧！",
    hook_fish: "按 <strong>LMB</strong> 钩住鱼！",
    instructions: {
      title: "操作说明",
      hook_command: "操作 (钩住/收线)",
      exit_fishing: "退出钓鱼游戏",
    },
    progress_bar_labels: {
      tension: {
        low: "低张力",
        avg: "最佳张力",
        max: "高张力",
      },
      progress: {
        low: "刚开始",
        avg: "进行中",
        max: "快要捕捉到",
      },
    },
    fish_details: {
      rarity: {
        common: "普通",
        uncommon: "罕见",
        rare: "稀有",
        legendary: "传奇",
        mythic: "神话",
      },
      weight: "重量",
      exp: "经验值",
      price: "价格",
      keep: "保留",
      release: "释放",
      illegal: "非法",
    },
  },
};