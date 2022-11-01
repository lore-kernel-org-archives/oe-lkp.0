Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1AC160
	for <oe-lkp@lists.linux.dev>; Tue,  1 Nov 2022 00:08:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0C3C433C1;
	Tue,  1 Nov 2022 00:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667261302;
	bh=BHsYFSGPeJZlDdPfZtu9dmLH7prYniwW58/JcZZ8z4g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BdOUbyTkmyvXOJA6cc7jBU15ZBT2twDMfO05OozTfZcJ7lm8u4pUuO33rFTmebL0x
	 7gKQjLwnbzMNQfW/n1rxcJnVGNwsi9/RZ/bY5wNvY2khr1ENIE3NUw3JZaPCi8tBwM
	 o6oj+/ZAQMgofaaAJfxswTsRdV0NrOLVzQ32AFv1h3T5fQIHGfHSSRlV5W5/gXEyAv
	 ioGwhR3B/s+2a707LPn7168Z1WtS0Sqhrz6nl/qSY00Z8mIu8kea2mUPA6N1DZb20e
	 c4lwwQhnPjWVKBjPvfzR6mNgnapp3XJvfZ+i9jd5PwxfAOUJ50/a1iqMQak48AYqJ9
	 1SwOMMvwEelRQ==
Date: Mon, 31 Oct 2022 17:08:21 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: kernel test robot <oliver.sang@intel.com>
Cc: <oe-lkp@lists.linux.dev>, <lkp@intel.com>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>
Subject: Re: [linus:master] [genetlink]  ce48ebdd56:
 WARNING:at_net/netlink/genetlink.c:#genl_register_family
Message-ID: <20221031170821.58b94623@kernel.org>
In-Reply-To: <202210301645.c89bc046-oliver.sang@intel.com>
References: <202210301645.c89bc046-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 30 Oct 2022 17:35:04 +0800 kernel test robot wrote:
> FYI, we noticed WARNING:at_net/netlink/genetlink.c:#genl_register_family due to commit (built with gcc-11):
> 
> commit: ce48ebdd56513fa5ad9dab683a96399e00dbf464 ("genetlink: limit the use of validation workarounds to old ops")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

FWIW this is already fixed in net by commit e4ba4554209f ("net:
openvswitch: add missing .resv_start_op")

Please LMK if the warning is causing a major pain for anyone,
otherwise the fix will make it to Linus on Thursday.
