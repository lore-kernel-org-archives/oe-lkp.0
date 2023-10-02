Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA89D53F
	for <oe-lkp@lists.linux.dev>; Mon,  2 Oct 2023 10:50:32 +0000 (UTC)
Date: Mon, 2 Oct 2023 12:44:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1696243503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LFijQqnn30Q1C9un8L0eTI0y5dQ879NsgPkLR/zZorQ=;
	b=CZQaDdJWlao+em4kDTjquFpv5Bc07oINtZ8MR/p9jRuGZjB8ZfZJlQLsJowT3bqk64z6hF
	nG05uIITRbZSrGfsDsXgupRufmoA8qWllzheWLROLc7iRPGQ62PUjMo3tDyEp2qhnWzKW+
	JDpQWF6uibECGzUuMV71VbyK7T21CKOzQn2OR6pPJg/Ey7TUHBu1wCjgnUDMGlZXBzAraU
	IRSbEejpiaU0IXFRzMBZB5r7gwGdhiL1CsmxX+Ne4djxI1iHI+pO3uPrQj/FPdXsjvPYGr
	4lBBw5jvvNVg6pNQ5YBTT5zV7m1iiDZl+1MJEUBgFv/YA47viDhvV/8VCLvXCQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1696243503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LFijQqnn30Q1C9un8L0eTI0y5dQ879NsgPkLR/zZorQ=;
	b=6w3nXrtLSGfPAc0dlIE2FIFuLt+6e6C2CAPhglo/V78QakfggsWw7QYa2cg5YRs+d6dtNw
	L4nmlApWpzby9OBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: kernel test robot <oliver.sang@intel.com>
Cc: John Ogness <john.ogness@linutronix.de>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-serial@vger.kernel.org
Subject: Re: [rt-devel:linux-6.6.y-rt-rebase] [serial] 7ae7fa6bcb:
 dmesg.inconsistent{INITIAL_USE}->{IN-NMI}usage
Message-ID: <20231002104459.-sjvh8h2@linutronix.de>
References: <202309301045.1475d353-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <202309301045.1475d353-oliver.sang@intel.com>

On 2023-09-30 10:40:09 [+0800], kernel test robot wrote:
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202309301045.1475d353-oliver.san=
g@intel.com
=E2=80=A6
> [  504.779539][    C1] NMI backtrace for cpu 1
> [  504.779544][    C1]=20
> [  504.779546][    C1] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  504.779547][    C1] WARNING: inconsistent lock state
> [  504.779549][    C1] 6.6.0-rc3-00047-g7ae7fa6bcb29 #1 Tainted: G       =
 W        N
> [  504.779551][    C1] --------------------------------
> [  504.779552][    C1] inconsistent {INITIAL USE} -> {IN-NMI} usage.
> [  504.779554][    C1] swapper/0/1 [HC1[1]:SC0[0]:HE0:SE1] takes:

I posted already a patch for the NMI usage before this report popped up.

Sebastian
