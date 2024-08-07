Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E171E3CBE
	for <oe-lkp@lists.linux.dev>; Wed,  7 Aug 2024 12:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723035334; cv=none; b=OyR2qLZ/0ziLUB0+hkEETukHY7W2sD1CDNE2ymopYZxmuNdn2WdPZhPtFP7NxwM0ctATH5jzFsWP3TKFQX12DJtSZ8ppJxnyuodUuowWUPQl50oomIicxQ5ReaVk2Zp/1pngcB6NyqG/BnVfQRQqCtzqLk2f22NrstewDSUgVuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723035334; c=relaxed/simple;
	bh=T0FMpysHiCok2rPZDxNM3hR5ykKAgKtyNJKDi4Mfg6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YOeD6C5H5fwUlUea/kIRiHu51KC1JIP82Faawm9gJODTfuHLuX70OXPXrv6Qzj9Q5t0Ww3wR4BL3/Nk1FOgctPBRfibkIM6V0rQX7xSX53gZBMxys5DhmtD/qdLzFeFt4rZQixGSQWMflUc5Tmg2QHACy3cq74aQ90Z2ML/X53c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qmH5GeUq; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qmH5GeUq"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5a1b073d7cdso33820a12.0
        for <oe-lkp@lists.linux.dev>; Wed, 07 Aug 2024 05:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723035330; x=1723640130; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0FMpysHiCok2rPZDxNM3hR5ykKAgKtyNJKDi4Mfg6Q=;
        b=qmH5GeUqVWXN2NPWCkvOSzM7FYKY0tHqOCSAEq2/elXTlXc4jtzgBTx+F0h/Aur5m+
         4oTgLPdUvs7C5fVOh3qBpCt/clhTdZq3Fo820U12UZ6mub3OqeNRmnoZqGWZi5aGreoq
         LqMty38CEu6S1CaSiDdx4okqFtccWe93TK1oiVN/xHilDs7y4wjIaMZFXrcQFwzjIOkN
         gP72ELHHFhxiJ1bdVP2HyuMbtIg9F+0bOnhue41MnM/UZb1dSvyJ3cWgVi9Dy6/moU0x
         hRPA02fL3Y4Uk8UzwqGBZRMWQYIV1XpyoZK+HJro0qOmNiRaRKPvnkMie6BdApoA7TFW
         qPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723035330; x=1723640130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0FMpysHiCok2rPZDxNM3hR5ykKAgKtyNJKDi4Mfg6Q=;
        b=DaBvc8iD5QZsFktAc8rfKsfmIOxeZyBgXl3pExuRvL8EekuB69RISvHWOTIUx16WUy
         QTEjM1shsuw39ddtDsRcEAxwm7uxs2+4ChdlJehRtxrfSyR69OalCIwXurDe536PAA2g
         qW+fzO6tJ9Z/8PoKt5m+9CVOGqCOB0hFfntJyUj+mVeUFLnWPEqBXmldTCcyqdJDXbD7
         OicIAGuqR+R93lRypZkcdQs9RZPcxzxHwsaM2BjnmYQitIZgy0qLTboxcP+t66d0JwZ0
         SVNifcyAYHAb6wKNeVRKFoOStadRM+shMUrNHFl+FKWKlybdAR2CNZZpjrSEuV4pdw32
         vJsA==
X-Gm-Message-State: AOJu0YwN3uuu3VixEw8v9Cz6YaF7rbpwOO5Ik3c94mVe3a5sJ9aWNEtV
	tG24IHtsPhGQ8auFODxY3k0Z24SrRJ6DZmdvpPbEn0sXlV8M9RMan7XGUw3RI3VD2IuxnVdB3x3
	rUj6yMc4jMEX0Uqr74jhBf6cmWFRi2ZvrVwVzwm5jCyU989MwyOKmHE8=
X-Google-Smtp-Source: AGHT+IHgukcefutx9sinCh379YuXQ81jKS9f06CI6Cgq+JpWyVbcyaOC5AGtbTillGrKY7STc613grub6WxXVKB/59c=
X-Received: by 2002:a05:6402:84c:b0:59f:9f59:9b07 with SMTP id
 4fb4d7f45d1cf-5bba28bb22amr186027a12.4.1723035328829; Wed, 07 Aug 2024
 05:55:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202408071606.258f19a0-oliver.sang@intel.com>
In-Reply-To: <202408071606.258f19a0-oliver.sang@intel.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 7 Aug 2024 14:54:52 +0200
Message-ID: <CAG48ez1if0dEpL9kdby=5=PcFfnwSP+xn_kKO2aibGpqNNqm6Q@mail.gmail.com>
Subject: Re: [linux-next:master] [slub] b82c7add4c: WARNING:at_mm/slub.c:#slab_free_after_rcu_debug
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Christoph Lameter <cl@linux.com>, 
	David Rientjes <rientjes@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
	Marco Elver <elver@google.com>, Pekka Enberg <penberg@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

On Wed, Aug 7, 2024 at 10:42=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com> wrote:
> hi, Jann Horn,
>
> as you educated me last time, I know this b82c7add4c is v5:)
> the CONFIG_SLUB_RCU_DEBUG is really enabled, and we saw lots of WARNING i=
n dmesg
> https://download.01.org/0day-ci/archive/20240807/202408071606.258f19a0-ol=
iver.sang@intel.com/dmesg.xz
>
> not sure if it's expected? below report (parsed one of WARNING) just FYI.

Thanks a lot, and sorry that my series is creating so much work for you...

Okay, all these warnings at mm/slub.c:4550 are for the "if
(WARN_ON(is_kfence_address(rcu_head)))" check, which was wrong up to
v5 and fixed in v6. syzbot had also encountered that bug...

Thanks for letting me know, and have a nice day!
