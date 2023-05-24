Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B668F538C
	for <oe-lkp@lists.linux.dev>; Wed, 24 May 2023 18:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5M781RqfVLpQpdHFeNAj7b3kW/gkEokVEHe2kPAGP2Y=; b=0cKEljTmCeyD3iZP48msGV+D1u
	BE8+IexiKKCJuchTPPyw6jQRIKJXZDYauNqnluWo25LM+TLuBdZg/+kexZC4PS1etRJ2J8IZ3mSvM
	h8AIO1mN9H3QtbCdkwrBeXBKuxUfVEGPoLk63BO+06j/2vYP0TXS4XPeekJpn/vOYzbg5BEaJ0OgJ
	BEdsKm1Uf/HYB0++1doXeTRmV+K75oE33TmpBAkdywXNILy1iuu5gLeYAvC8HKabSxP3QAMy6e/jj
	WKmob5WSVaXChmvFwzjkki0rzmboNkJIZ/Yt0RGsUy/lKQx9pHbsLvOoKPw6x9kuPvNEELVFpLdAm
	Q6Jb0YrQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1q1snW-00EIx3-3A;
	Wed, 24 May 2023 18:01:18 +0000
Date: Wed, 24 May 2023 11:01:18 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: kernel test robot <yujie.liu@intel.com>
Cc: Joel Granados <j.granados@samsung.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [linux-next:master] [sysctl] 7eec88986d:
 sysctl_table_check_failed
Message-ID: <ZG5Q7uBYGjbx4TuI@bombadil.infradead.org>
References: <202305241701.115a6cf4-yujie.liu@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202305241701.115a6cf4-yujie.liu@intel.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Thu, May 25, 2023 at 01:55:45AM +0800, kernel test robot wrote:
> Hello,
> 
> kernel test robot noticed "sysctl_table_check_failed" on:
> 
> commit: 7eec88986dce2d85012fbe516def7a2d7d77735c ("sysctl: Refactor base paths registrations")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

Fixed by 2f5edd03ca0d7221a88236b344b84f3fc301b1e3 ("sysctl: Refactor base paths registrations"

https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?h=sysctl-next&id=2f5edd03ca0d7221a88236b344b84f3fc301b1e3

  Luis
