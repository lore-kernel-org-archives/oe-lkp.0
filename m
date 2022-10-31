Received: from zju.edu.cn (spam.zju.edu.cn [61.164.42.155])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334AE210D
	for <oe-lkp@lists.linux.dev>; Mon, 31 Oct 2022 13:12:15 +0000 (UTC)
Received: by ajax-webmail-mail-app2 (Coremail) ; Mon, 31 Oct 2022 21:05:15
 +0800 (GMT+08:00)
X-Originating-IP: [10.14.30.50]
Date: Mon, 31 Oct 2022 21:05:15 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Jinlong Chen" <nickyc975@zju.edu.cn>
To: "kernel test robot" <yujie.liu@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-block@vger.kernel.org, 
	linux-nvme@lists.infradead.org, axboe@kernel.dk, kbusch@kernel.org, 
	hch@lst.de, sagi@grimberg.me, bvanassche@acm.org, 
	linux-kernel@vger.kernel.org
Subject: Re: Re: [RESEND PATCH v2 3/3] block: hide back
 blk_freeze_queue_start and export its blk-mq alias
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2022 www.mailtech.cn zju.edu.cn
In-Reply-To: <202210311456.2d2c7899-yujie.liu@intel.com>
References: <202210311456.2d2c7899-yujie.liu@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <e316420.15e91d.1842e256c7e.Coremail.nickyc975@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:by_KCgCHz1sLyF9jH0BTBw--.53074W
X-CM-SenderInfo: qssqjiaqqzq6lmxovvfxof0/1tbiAgIAB1ZdtcLuXwAAsK
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VW5Jw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=

Pgo+IEdyZWV0aW5nLAo+IAo+IEZZSSwgd2Ugbm90aWNlZCBXQVJOSU5HOmF0X2Jsb2NrL2Jsay1t
cS5jOiNibGtfbXFfZnJlZXplX3F1ZXVlIGR1ZSB0byBjb21taXQgKGJ1aWx0IHdpdGggZ2NjLTEx
KToKPgoKU29ycnkgZm9yIHRoZSBkaXN0dXJiYW5jZS4KClRoZSBwYXRjaCBzZXJpZXMgaXMgZGVw
cmVjYXRlZC4gUGxlYXNlIGlnbm9yZSB0aGlzLgoKVGhhbmtzIQpKaW5sb25nIENoZW4=
