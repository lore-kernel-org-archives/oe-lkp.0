Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE1625C6E9
	for <oe-lkp@lists.linux.dev>; Tue, 11 Mar 2025 18:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741717109; cv=none; b=MkvgBJ5t2H3MoZ27TWeq+M1d49hFgWNs8k7tNCds/8IdvmiVc9tZx1EAl2jvJ7+MgIFwfPQoR2ooljkvl0UZ/0NwB69A15+zzw7Ql11uLk9J9L0C8N7bf3ch5ZGFGjQImj4Ts6DlI/jOVKCbWHx4my7z9PPBQXEWn5KyYlx5nUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741717109; c=relaxed/simple;
	bh=B4EDiJATBGplouNlY0Ug77bVLxTrZJQU3PIB7EwlYN8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=XrJVt+PzkrYtz7enDT+gcUEphz6N9Bpg7oKKi+HLOJ97CMmaTngxMDRLpz5NL2BsTAbSrxXgul0VUygN/YY8iEz+wqoQp+QRE5ar0fJygSGjoZD+ncquyJouPCvzKYTeyxx2ZtyIlyynu0lcJjFuMW+9djG1sAUIv6ixF4Arm2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dqcbK9WU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dqcbK9WU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28161C4CEEA;
	Tue, 11 Mar 2025 18:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1741717109;
	bh=B4EDiJATBGplouNlY0Ug77bVLxTrZJQU3PIB7EwlYN8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dqcbK9WU+fbaXQRxOCqoLxquJ2Mspb2rNqRHtenUH09Ok4vU3UBhTraQSS7S0MYVG
	 oXOUp2LZGgxzSzawqf7GqbzFeL8D+IzcOiRfmKZZrCLYGjsAuIRD5Sg8YNED8jVa6k
	 kjJT4v1GzCNegFN7URwiMZ58B6eZW+sbpRsSw2uw=
Date: Tue, 11 Mar 2025 11:18:28 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Uladzislau Rezki <urezki@gmail.com>
Cc: liuye <liuye@kylinos.cn>, oe-lkp@lists.linux.dev, lkp@intel.com,
 Christop Hellwig <hch@infradead.org>, linux-mm@kvack.org
Subject: Re: [linux-next:master] [mm/vmalloc] ff6f2b81ea:
 WARNING:at_kernel/fork.c:#vm_area_init_from
Message-Id: <20250311111828.10b30576b9392e56d2c3f963@linux-foundation.org>
In-Reply-To: <Z9AwAKYI92AgIJ8M@pc636>
References: <202503101629.7289b1-lkp@intel.com>
	<Z88Y4KcvjcskC5TW@pc636>
	<e563f63c-a37f-4405-921f-6da6c9709788@kylinos.cn>
	<Z9APeowHOXe-MkV2@pc636>
	<Z9AwAKYI92AgIJ8M@pc636>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 11 Mar 2025 13:43:44 +0100 Uladzislau Rezki <urezki@gmail.com> wrote:

> > > >> config: x86_64-randconfig-101-20250306
> > > >> compiler: gcc-12
> > > >> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> > > >>
> > > >> (please refer to attached dmesg/kmsg for entire log/backtrace)
> > > >>
> >
> Could you please share your view what we should do with the patch in
> question? I mean we can drop it, since it is broken and there is also
> another option - it is to fix the broken patch.

I dropped it.  This can be addressed in the next version, if there is one.
