Received: from fra-out-001.esa.eu-central-1.outbound.mail-perimeter.amazon.com (fra-out-001.esa.eu-central-1.outbound.mail-perimeter.amazon.com [18.156.205.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB1717C211
	for <oe-lkp@lists.linux.dev>; Fri,  7 Nov 2025 08:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.156.205.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762503575; cv=none; b=DX10njx2MnUGXaZu6u/DlACWtNo9Rdz07fnYBKK0rmR+XMSMGmJK60kEhG8Z7v6Ouc1MRPt91XrhNAiXi3kWqzRypIDCZMBx7fzottvye9lxMg4blfTJNgFAB1qY8Ay72VkseuyqIq4z5ZcJYvvRL8jD/nUSCEdYbbHgdUqnR+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762503575; c=relaxed/simple;
	bh=Okz0T+2CL4bs/7/AgL5CQMeGxGIkYXtVvI9MXdL3cO8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=parweJSghLb61JqTSZcaour3nFwMGag5bgS6E0nhB4pwmPRXxwSX3C3wsrD0L3asrxORXd/WQ55F7gQ4DghqjFCBqD4djMDToOCOpN5T3sKxJCQPJ2s0k5vmHYHFShbgi0hGy0svVIN19yU9fsRwYYqm46Wfif0vn+PMm8Yd/XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=rb3HwtgN; arc=none smtp.client-ip=18.156.205.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="rb3HwtgN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1762503573; x=1794039573;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vN74N/f0kqrLSBtZchQLOpLJra6T02Bk60kvjsc3zFw=;
  b=rb3HwtgNeJ5a2Z4n7IfaunYshuUAedRXUJEv76FKj1nPTroqjbNr4Yb1
   a2m11VIEhFKIThWlzgE20vEkP7+rHJuiFlrczvXoSg/zaq9JVrCBoIilP
   e267yQEXTWRBpC3mnA7ymqAtg0xlIhrNEOXBb/OaydhZbwz/scQ0Ox6WQ
   TUeTvbh9lOMctYG+SV+4L8g+QLOUktKQARgzEoHqT/3OHFyUdbe1yQNOs
   KNIocwpks2M1b+LI9n+JYqa1JvnIlbOfGk5vzBd7uVSqQI5hlo8eSlCSn
   ZWMTIPnZFoM5bVBzH1SFB9ZvNmpX2eEJEj4NBSGCxYsBKrjBnPduTNApN
   Q==;
X-CSE-ConnectionGUID: 0F7Zf6NzS6mAv0MoBlCXRA==
X-CSE-MsgGUID: /wUSzA3kQf2TVJKPaCoyRg==
X-IronPort-AV: E=Sophos;i="6.19,286,1754956800"; 
   d="scan'208";a="4808309"
Received: from ip-10-6-11-83.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.11.83])
  by internal-fra-out-001.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 08:19:15 +0000
Received: from EX19MTAEUA001.ant.amazon.com [54.240.197.233:21353]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.25.163:2525] with esmtp (Farcaster)
 id dbff45c3-fe59-4f90-8a9e-0823c34a4a7b; Fri, 7 Nov 2025 08:19:15 +0000 (UTC)
X-Farcaster-Flow-ID: dbff45c3-fe59-4f90-8a9e-0823c34a4a7b
Received: from EX19D003EUB001.ant.amazon.com (10.252.51.97) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29;
 Fri, 7 Nov 2025 08:19:13 +0000
Received: from u5934974a1cdd59.ant.amazon.com (10.146.13.221) by
 EX19D003EUB001.ant.amazon.com (10.252.51.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.29;
 Fri, 7 Nov 2025 08:19:09 +0000
From: Fernand Sieber <sieberf@amazon.com>
To: John Stultz <jstultz@google.com>
CC: <peterz@infradead.org>, <aubrey.li@linux.intel.com>,
	<linux-kernel@vger.kernel.org>, <lkp@intel.com>, <oe-lkp@lists.linux.dev>,
	<oliver.sang@intel.com>, <x86@kernel.org>, <yu.c.chen@intel.com>
Subject: Re: [tip:sched/core] [sched/fair] 79104becf4: BUG:kernel_NULL_pointer_dereference,address
Date: Fri, 7 Nov 2025 10:18:52 +0200
Message-ID: <20251107081852.121111-1-sieberf@amazon.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANDhNCpZWFsxZsmbXY2Q6DBfovqas8haepdYyx=RpWsZGDKN0A@mail.gmail.com>
References: <20251106104022.195157-1-sieberf@amazon.com> <CANDhNCpZWFsxZsmbXY2Q6DBfovqas8haepdYyx=RpWsZGDKN0A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ClientProxiedBy: EX19D035UWA002.ant.amazon.com (10.13.139.60) To
 EX19D003EUB001.ant.amazon.com (10.252.51.97)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 6, 2025 at 3:57 PM John Stultz <jstultz@google.com> wrote:
> Fernand, Thank you so much for root causing this, and helping validate
> the fix works!
> I apologise for missing this case in my testing.  I'll try to see if I
> can include the trinity test in my regular stress testing.
>
> Do let me know if you do see any other proxy related issues!

Hi John,

No problem.

I'm curious to understand more about the regular stress testing you are 
referring to, can you give me some pointers please?

Thanks,
Fernand



Amazon Development Centre (South Africa) (Proprietary) Limited
29 Gogosoa Street, Observatory, Cape Town, Western Cape, 7925, South Africa
Registration Number: 2004 / 034463 / 07

