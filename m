Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16961DDD6
	for <oe-lkp@lists.linux.dev>; Tue, 23 Jul 2024 22:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721773240; cv=none; b=B9vYuuBp9d6BYjn1dUQdn2ap9VUq6JrtFPCy5TihdgudCwcVRZwBuYr+hqf38rFyhuzeM5CXn4mjMVhg/p/GjnLjUOTIM1BDtv+o+TboQ8bVRACw5alJyWxLCSAzqkknb2UG0SSwTyRblC18ckW1WsNbqtLVwOIGqmblDmlaNBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721773240; c=relaxed/simple;
	bh=PhiCGI+0lDmU9VS6dUAiwV/J0u9+jwn3moE1mGNrvpQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HqByYwgxBgipW1VvNREcX8W0RMNj9NC26IF4aQtZ/IMhfnkk/0P4SZ7MPt2QXZLwXZHxB1IiLQraU/sOu8NryXZt/16pQOiM6tss+fd8kV0cF6H/bHOFeQty2og4EwKidoDMO2VgiKtwpatmlZe+C4g8tFczeOg5da8ymziqvBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hou8RYZb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hou8RYZb"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4266edee10cso40505895e9.2
        for <oe-lkp@lists.linux.dev>; Tue, 23 Jul 2024 15:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721773237; x=1722378037; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhiCGI+0lDmU9VS6dUAiwV/J0u9+jwn3moE1mGNrvpQ=;
        b=hou8RYZbm7t5wzMQ1DRhPLa7MJUwpRcKOh4eb4xGpjCS4XxxKhasNpULqmSKBMB2e5
         pPxUHp9qmo+OB+aknz2S4WEBoYQj3sOI4NwGkbIdig/FkzYli3qC0alSdz128MwRBcCI
         sEaWCcfEbCdLvlb1LdhtvEuIxI+iuYVhUtesPBdOEqVXTlcO+ghn/akbCe8XDQcEQJOL
         nYNEgRceSjMAkvZBREvuVaftVOiVonmgvinuHNmh60ZQDsL2tkNriD6T1Qx8+QRj4NtI
         hmk4Jo816ugvUAqfAIaxMfBkTSp9Z0fYiI342aoFUSyG00Szs/is49drY6k8Pv92VX21
         k3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721773237; x=1722378037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PhiCGI+0lDmU9VS6dUAiwV/J0u9+jwn3moE1mGNrvpQ=;
        b=ajU/fldgbGCdyJyHDYmnnMxfOIywOR7rPpuAR66vtBwILgtwHEmRT4rh8c/MZ3w0tl
         w6+524o9Ro5SBFzz28QeYPaUpbsfB2f43kuesiFp3ykRb1794uIw6eP5IesBdEqnBadY
         5kN13NvpP5STV4iGgYNHdKG7SCEG4iJeWWw1wYJ969YJgQrigeRv791bzBJ2FCP8DMUz
         Hbgm02A9Rb+qzBUOGYm8dopB1nid0b59xYQei9tM0hzrLA9qwhVdFqLMJQsIB6yPHk87
         7eNP0eu8fy5w5T35cr2glO/SSwALlMyMeE/DvsOyYFdb6thUGK2A1zacglG6t1+VH5FT
         v8+g==
X-Gm-Message-State: AOJu0YxHlb/+/Bv3BqoBNF4nWMZCWAEAMOepJrx5fTbGUonLgOeSyMqM
	zWxTdbpUEOUOZXVphuxQc+al6Jn67ivMzrbBreoKxUdxnPeOidJbffhlMgGTLUjLVPLz0qciuRR
	qGREnJ2Y+XrhO6cG2lMH9GqTVtpg=
X-Google-Smtp-Source: AGHT+IG0VqeACNNp75xPFIsOP06VyHtdPzXgXp9EVPC8LjE+ce4xQq68nuZDpbQzIrjdK+Lwmyu5YW5gToacP2SXhKE=
X-Received: by 2002:a05:600c:19ce:b0:427:dac4:d36 with SMTP id
 5b1f17b1804b1-427f954287emr1330255e9.7.1721773236693; Tue, 23 Jul 2024
 15:20:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202407231547.389c0ad2-oliver.sang@intel.com>
In-Reply-To: <202407231547.389c0ad2-oliver.sang@intel.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 24 Jul 2024 00:20:25 +0200
Message-ID: <CA+fCnZd2G5Zm4tcW1qTEHrzDAM=K6apCSftYKgLMETJ4FBGNAA@mail.gmail.com>
Subject: Re: [linus:master] [kasan, fortify] 2e577732e8: BUG:KASAN:global-out-of-bounds_in_usb_copy_descriptors
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Erhard Furtner <erhard_f@mailbox.org>, 
	Nico Pache <npache@redhat.com>, Marco Elver <elver@google.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Daniel Axtens <dja@axtens.net>, Dmitry Vyukov <dvyukov@google.com>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2024 at 10:51=E2=80=AFAM kernel test robot
<oliver.sang@intel.com> wrote:
>
> Hello,
>
> we noticed this is a fix commit, however, we don't have enough knowledge =
to
> determine if new KASAN issue is expected actually after this fix.
> so we just made this report FYI what we observed in our tests.
>
>
> kernel test robot noticed "BUG:KASAN:global-out-of-bounds_in_usb_copy_des=
criptors" on:
>
> commit: 2e577732e8d28b9183df701fb90cb7943aa4ed16 ("kasan, fortify: proper=
ly rename memintrinsics")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

Hi,

Yes, that patch might uncover new bugs that previously were not
detectable. There's still a chance that something is wrong with KASAN
and it reports a false positive, but most likely, this report is a
real issue.

Thank you!
