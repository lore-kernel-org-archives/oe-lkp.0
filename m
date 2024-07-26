Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4252B178361
	for <oe-lkp@lists.linux.dev>; Fri, 26 Jul 2024 09:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721986852; cv=none; b=Sx8ixrbnw2O3eiwhgkrc9XoXHRfxHKqCqoUxosTSjqFwdYg2tl0jVAILngzuJRD7ULw0m2PFaxawwtjjlct2XCMgCPhsdWEcY8EX1xf4F9GSGzP9gsALI48xuS6Pgds3+aOPBDD7V3Crl2+XCvUcTrPbitCLZVVq3iNi+IJSwxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721986852; c=relaxed/simple;
	bh=REuB5YOb/wxPQ5FOE3gwUmVnhCEuw5n23LIuVx9cWfg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atBBJaJsd49Qcx9rI5v9uHJpovz/Z6LsZe8L/OG/germ9wLGRH3ig4P91+bcS8GvgIF/OJykBbEU++vXBWrN59tgvT8KzxDn3ujY6IBgtEJ1yViiszUKY74+dC7rN18GBU6Dv1nJkBT6s2n2hH28Wixgw7VVVoQwInvjE4qSDGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3EiBljF; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3EiBljF"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52f0277daa5so1611415e87.0
        for <oe-lkp@lists.linux.dev>; Fri, 26 Jul 2024 02:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721986849; x=1722591649; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9XKH/1XXRddfq6FM5K3um05jFgZAL/dcezQzaeXuMZ8=;
        b=a3EiBljFxfsVyPEdi4spn57lCAh0BCUT6rAZ8N/lA7AqTl5ZZcKk75wy7sRKME+k/J
         ++WIrXMqa6ONSWLmWIHmvYCfB+TjWQEyNVTzVwlC6c6srBRVY4ZGoElEpT3wy1+TiLhg
         ip0l872LAJz8m/o+UWMEzPKa/aBD23oCewio2CebD6YqdtJNAjAUSrmgUIezveuUtHjY
         qLri/Ib3U2tN3QK+g7yPkcMt9raW6fW7AAkFelRvU8MoKPeXPp+8T4GhDRweNUfoj1zO
         aWSdl3WjSr3zzpKTkrfMvtwQKZecl2ctEbCBpiN7nKyPjo95QRvYdjQV07OyYXR67LHr
         1Anw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721986849; x=1722591649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XKH/1XXRddfq6FM5K3um05jFgZAL/dcezQzaeXuMZ8=;
        b=w64h0BYINOCvW+CPVSh0QKP553D7EADfgCOpcma86hwheq2lOMiJXEzPwzKa3Ywptn
         GEaqpRnmKSLR3Sm8D2rkyLe4gcPFiY95a/0Yx/IQngxZIPXsg80PNn96Sf+PBl/gVBxK
         RieVN57l6RYX9AwcxOWcwZQAA5QEPgHjhidOhSu1uWDrkIQbxslV67SVZ7rXxzx8oUSc
         5PRHbww9Gln0OKBo2jVKcN2Qgm9FSLQPdC+Xu+74514paNH0HTdmJnMmzryP/OhFFO/X
         Os6Yfy1MFMdcLN956V7Ahj3hvy7Yp25MdbadStUxCX7gZ9zeqoefIDOD/sHYDQtoQPhX
         9sww==
X-Forwarded-Encrypted: i=1; AJvYcCWC+m1XhueDAJWr7xpfLStk1z0twnT5AlE5RDNNLdPvwdwZO234m5s5D5tU2VwAqBFXvcjJCro=@lists.linux.dev
X-Gm-Message-State: AOJu0YyuPELcQdxowP9pT+7iCEqUl1Mt0VuSlMmtss8kHaU9B2jIMCxa
	fzmnq0yjpeyywtxKuSnx1B6og2witfuDYQFv966fLdbNXnzJgUWg
X-Google-Smtp-Source: AGHT+IGxteMPmO0hYq91n8+s1yudDcT2HcqxVBNrQbT21+vrNjk6GoCxOWwvDeq6puujqFjEZMxq6w==
X-Received: by 2002:a05:6512:124d:b0:52e:a60e:3a04 with SMTP id 2adb3069b0e04-52fd6098b28mr3833002e87.59.1721986849068;
        Fri, 26 Jul 2024 02:40:49 -0700 (PDT)
Received: from pc636 (host-90-235-0-241.mobileonline.telia.com. [90.235.0.241])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c2d48fsm444127e87.275.2024.07.26.02.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 02:40:48 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Fri, 26 Jul 2024 11:40:46 +0200
To: Vlastimil Babka <vbabka@suse.cz>,
	"Paul E. McKenney" <paulmck@kernel.org>
Cc: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-mm@kvack.org, RCU <rcu@vger.kernel.org>
Subject: Re: [vbabka:slab-kfree_rcu-destroy-v1r0] [mm, slab] df00e211c9:
 WARNING:at_mm/slab_common.c:#kmem_cache_kfree_rcu_destroy_workfn
Message-ID: <ZqNvHo70xFX71LRu@pc636>
References: <202407251313.32e55498-oliver.sang@intel.com>
 <4b31f1be-fbc5-404b-8a4e-1eb2ad4111e3@suse.cz>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b31f1be-fbc5-404b-8a4e-1eb2ad4111e3@suse.cz>

On Fri, Jul 26, 2024 at 11:34:57AM +0200, Vlastimil Babka wrote:
> On 7/25/24 7:59 AM, kernel test robot wrote:
> > 
> > hi, Vlastimil Babka,
> > 
> > we noticed by this commit:
> > 
> > 7fd4dfd0d38db6f3 df00e211c9c11e8d20f2ea7b4ab
> > ---------------- ---------------------------
> >        fail:runs  %reproduction    fail:runs
> >            |             |             |
> >           6:6         -100%            :6     dmesg.WARNING:at_mm/slab_common.c:#kmem_cache_destroy
> >            :6          100%           6:6     dmesg.WARNING:at_mm/slab_common.c:#kmem_cache_kfree_rcu_destroy_workfn
> > 
> > below formal report just FYI what we observed in our tests. not sure if it's
> > valuable to supply any hints.
> > 
> > 
> > Hello,
> > 
> > kernel test robot noticed "WARNING:at_mm/slab_common.c:#kmem_cache_kfree_rcu_destroy_workfn" on:
> > 
> > commit: df00e211c9c11e8d20f2ea7b4ab1d7c9760fe822 ("mm, slab: asynchronously destroy caches with outstanding objects")
> > https://git.kernel.org/cgit/linux/kernel/git/vbabka/linux.git slab-kfree_rcu-destroy-v1r0
> 
> Yes, that's expected proves we need the proper barrier added from the RCU
> folks :)
> 
Give me some time, i will implement it! After discussion with Paul it
should not be so hard :)

Thanks!

--
Uladzislau Rezki
