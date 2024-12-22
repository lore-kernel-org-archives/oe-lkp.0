Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5ADB1FDA
	for <oe-lkp@lists.linux.dev>; Sun, 22 Dec 2024 21:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734902404; cv=none; b=MjUg0F9rphlQ2cckbhmC804uMKdlF3XiP5rCNOVl6yF7e1cMhJWKVpOrlP5Z1wpusf365fIuzL7dXljXTRvLbOJ5c+qNpIYmAhfk/VFwtyRzFr2CJRRMoS8Cz0UvxGLiIsa29Lx5VSmXiWVuTGYgUYKT+0AjqlT6lSHEvVUBWjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734902404; c=relaxed/simple;
	bh=AH9WqKG2B5s8LW3sbM7NzIKm0OQNo7c/Iph5foMbQ1U=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mlpXIji1xt5PNGzTNer6Pwdwxp62Wk5yZpB6FND0TBJIe6DSQr5HkskvNC70VmICd1vj/52oTEGltOp4N0XuiFqGQub6NTGr9ZT91R+OK6avufNKNBeMPuXgozptmgf8Di4HjWB9vvI1s8KEnB4E6r54F7Y3PSbscIN72QrlLD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=urDmd9CZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KkrMYTgn; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="urDmd9CZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KkrMYTgn"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 8F8F81140103;
	Sun, 22 Dec 2024 16:20:01 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Sun, 22 Dec 2024 16:20:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734902401;
	 x=1734988801; bh=UZ/imFC+jLSG6DNKtIOPlLRWKhXISQS6r9/H4PM3ISE=; b=
	urDmd9CZ3ozyp18gRUVLFDUgBsh3Qh5RVqYd/wBX3J/p/gtYCPCxsoUFSQVVx9GB
	6gazgfdOnqaUkw1O1rexN0i6jBw82V10k3E7A2W6PyXYKatzMJCYra6yD7V1RtW4
	ah08nQjGIHb52PGeyhK1+XmHHy33X+8/usoGX8L6XPmNDwa1X2G4JDsAmI9zY+Zg
	ksw21itrZCVBT+aFEas3hU8GsYxPzLgJ8tH+qza4D5sseu8THGycb2PrWB+R22AP
	si5HNXwjS4jLESvps1B/Djn5Iy19J6X/G7l17WD8uqBCqnBqCeQ29lJHFFgapECc
	PKb6Dh7PF8jpX1in4CeeFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1734902401; x=
	1734988801; bh=UZ/imFC+jLSG6DNKtIOPlLRWKhXISQS6r9/H4PM3ISE=; b=K
	krMYTgn6WYMZq6LSxpMXJJZRG0V1e7+pFn3uZ/8mgO2KT+mwsayFH5LnBa26VFiD
	do31cVne0lp9ShYohvESBxP9AeBpEAldG9gieYhmugfBlRqibdUxc+nkNE1KSZjX
	pwArY+chYdwPJS/J2/g2bm/vBQo4dCM2mjU31z+1nrtBfX5j8OKS3swZi3rv5+ql
	gGWvaFRd9KreLYD3krp2VdGl3BdNIos6MtH+HNKSFJ3dyWYeMCV1dtv8v1Ki/9dm
	a8d68O7kXLL6FTyQMEebxvI/lsghuxVoGqQU75HTKVqHOWGxPKuYcqcYkm72OqYt
	q3eSMVJrOwMlpKyrr/DeQ==
X-ME-Sender: <xms:gIJoZya1TY2p6eq0C9EgvG0_WEU8izAIjS8nTHh7FQkdUdV_hDn5fw>
    <xme:gIJoZ1Zh1DUIr3rhH1wKSgFndwea0gPDWWnsYLdyK_tQKZtqGbkQluec11Nxo67Rk
    7chXoXcR3lhLKCQKaM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtkedgudegiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedu
    hedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpd
    hrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehl
    khhpsehinhhtvghlrdgtohhmpdhrtghpthhtohepohhlihhvvghrrdhsrghnghesihhnth
    gvlhdrtghomhdprhgtphhtthhopegrnhguhieskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeigkeeisehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlihhnuhigqdhmmheskhhvrggtkhdrohhrghdprhgtphht
    thhopehtghhlgieslhhinhhuthhrohhnihigrdguvg
X-ME-Proxy: <xmx:gIJoZ88NiQHWrCqBezMuoDzjXWpD5Qg8m4o2EhaTix20XBN5LCELhg>
    <xmx:gIJoZ0pHektc1-9_hzYNHPqvHR97IjiIZJ7asaBP3eFH-OOINn86yg>
    <xmx:gIJoZ9qamB8U-R7jkL6DmvB0WlCVwSRKTGsJcFWXh6u4ek6qgE2D-Q>
    <xmx:gIJoZyRn-NxyUIo1lc-HpwgKXVfJRs4F2-gaodjmpTbkoh0U7jVing>
    <xmx:gYJoZ4ANtwwbO3fnGv77hWVrY4NojXPHwklTTQW2laJLnKnA9fdWlMku>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5795E2220072; Sun, 22 Dec 2024 16:20:00 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 22:19:39 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <oliver.sang@intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: oe-lkp@lists.linux.dev, "kernel test robot" <lkp@intel.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Andy Shevchenko" <andy@kernel.org>, "Matthew Wilcox" <willy@infradead.org>
Message-Id: <0866384c-990f-40b2-8815-2525f9323453@app.fastmail.com>
In-Reply-To: <202412201005.77fb063-lkp@intel.com>
References: <202412201005.77fb063-lkp@intel.com>
Subject: Re: [PATCH v2 07/11] x86: drop SWIOTLB and PHYS_ADDR_T_64BIT for PAE
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Dec 20, 2024, at 03:52, kernel test robot wrote:
>
> config: i386-randconfig-001-20241213
> compiler: gcc-12
> test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>

I haven't been able to figure this out, apparently something goes
wrong on a KVM guest that has more than 32-bit of addressing (RAM+MMIO)
when it uses a 32-bit phys_addr_t.

I changed the patch now to only drop SWIOTLB, not PHYS_ADDR_T_64BIT.

       Arnd
