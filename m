Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4457BA50
	for <oe-lkp@lists.linux.dev>; Tue, 18 Apr 2023 20:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15CDAC433D2;
	Tue, 18 Apr 2023 20:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681850583;
	bh=AhHTiolfz5eUi5cvQVyc8oJMl78RO/8qvco/Ki2ZAnw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QcgMoLBn0xT12+BAGcVMWbDxOklEc5Tk/pY7TJkv0VvFFPm4HBYqR9JM4IQrB/Ej2
	 EncmRqSFI9Sm2sYSD5f+5qNKRp1NnFeWXtOA2833EFAcHfhyRm9Gx8VFC11c4HXTT0
	 n9U+Xc6oDg9kNrDjvyCZtXprYZ/decQpvSvJbU7ZekjspEfzA1fPCfBNqjId1mLuIx
	 PHTYPE5xPXaP4P89acGr5W8JdWqM2e5QfD6FydFXc8VwSxlXckLtYf0PVkn/u7+clt
	 6aiazaIh5GXNUbocoK3xWyKI4jqD16hulJhGJYBDetK5vqcUZb5Zz0Cc+4N+RRw5fK
	 rPJ9mMT7Cg8vA==
Message-ID: <509b08bd-d2bf-eaa8-6c49-c0860d1adbe0@kernel.org>
Date: Tue, 18 Apr 2023 14:43:02 -0600
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [linux-next:master] [net] d288a162dd: canonical_address#:#[##]
Content-Language: en-US
To: Leon Romanovsky <leon@kernel.org>,
 kernel test robot <oliver.sang@intel.com>,
 Wangyang Guo <wangyang.guo@intel.com>, Jakub Kicinski <kuba@kernel.org>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 Linux Memory Management List <linux-mm@kvack.org>,
 Arjan van de Ven <arjan@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org
References: <202304162125.18b7bcdd-oliver.sang@intel.com>
 <20230418164133.GA44666@unreal>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20230418164133.GA44666@unreal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/18/23 10:41 AM, Leon Romanovsky wrote:
> Hi,
> 
> I came to the following diff which eliminates the kernel panics,
> unfortunately I can explain only second hunk, but first is required
> too.
> 
> diff --git a/net/core/dst.c b/net/core/dst.c
> index 3247e84045ca..750c8edfe29a 100644
> --- a/net/core/dst.c
> +++ b/net/core/dst.c
> @@ -72,6 +72,8 @@ void dst_init(struct dst_entry *dst, struct dst_ops *ops,
>         dst->flags = flags;
>         if (!(flags & DST_NOCOUNT))
>                 dst_entries_add(ops, 1);
> +
> +       INIT_LIST_HEAD(&dst->rt_uncached);

d288a162dd1c73507da582966f17dd226e34a0c0 moved rt_uncached from rt6_info
and rtable to dst_entry. Only ipv4 and ipv6 usages initialize it. Since
it is now in dst_entry, dst_init is the better place so it can be
removed from rt_dst_alloc and rt6_info_init.

