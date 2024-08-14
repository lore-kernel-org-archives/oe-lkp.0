Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849A33A29F
	for <oe-lkp@lists.linux.dev>; Wed, 14 Aug 2024 04:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723608621; cv=none; b=YFHzMvRFW0tNj1Ip75njLAWqGdB8/xVUKiIWzeeRWXSKy0g/ZXQcfaEdK2+lfZXwHvKmTGJpIVUfW0qq0aMxsgWglh99yerRG2/u5DxJqc9KwZHluP76skIOXAJHnUFrPa7e8tnWPwlBwtu1YVHBkLylK5CqL5aIinV84UNCwtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723608621; c=relaxed/simple;
	bh=RipD44cWDMWQ+jXO625TvEblj6I0eqqeYpF2laH7znk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GkZImAhmynPlPMfZVv6mKiBBlu9vtWZct9hR+nt0QWheVINSad9B6ktzFZvZtAG2QzufXl5IPLSUYK/sqk5gKImyHljAbD8Gekd2dUivBWBdJpZ+cvhhBmAoTm10PAF8Z3EaGE1pqjfXWo8gkqlFrWSwQGLnSdJIYBX8DxZrHto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FFpxOIvA; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FFpxOIvA"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a7aabb71bb2so643075366b.2
        for <oe-lkp@lists.linux.dev>; Tue, 13 Aug 2024 21:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723608618; x=1724213418; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISPW+Qx+7bzTu2MxU1tIs/xLNXoLPqwd8ac6oJ+C4UM=;
        b=FFpxOIvAguOPIiRnk7aBwO06ad5ph4IE79CIblP7TQN8jV3ePuBIiTlVGAzcySFYmH
         piVC5CsxM/y1TWbJmOc+ynXkNG0uv0uCZ5p2w1lXclr8mxPxFZjTQVJeNRFqQ0AhnG5Y
         YinqUFYTjJ50bSemj07yQeMap7VI1gQOYczMxXxU1YEsf4KuUw+hKF/aPrmBv26gELQ9
         ffspsw932cbOU4JhETEYQ/ISy039RA3DDNjH6yg5J634Nl2eXqH06f0cd7fsx53qdLHX
         M7jRdlVGhgPIAGwuBxQd2uAWClz5EnPEkcId/H3D00KdWOgYcZejCqmA3rKNpiMFdHlB
         UdAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723608618; x=1724213418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISPW+Qx+7bzTu2MxU1tIs/xLNXoLPqwd8ac6oJ+C4UM=;
        b=Ia2hZcBrgQwL1N9cbgp75eQY4WwihqFvooN4f7RmWGFsLMPTgTXC52xGBwpaFTuVex
         Qd9cin0PV29cgRztmH5xccj0Bqa/YaHiJeYHsyRRp9DFh6chn4hsVe4QCKDp9ZLLdXEx
         FsOtnPNSMirDgJCsP3h29Q1GHgYySk6zWhkOiUogw7o0VZjiPTZt19MPWM5dM8j97bAi
         3oZst3CSYp8odo+jXEc8QTpfwLiH9CZmm48dJ6A7HvEOoICMyVNVavWz+nVq7H1SAR3L
         fQjcN4Vn0zNaJgR6h43HSDpJdu3RFJr6wQQ6h5KwcDCYw09B8pXg0n3TzHnkZ50raEud
         +nEg==
X-Forwarded-Encrypted: i=1; AJvYcCWmwu11Ov/kXjZz60+Xx5NAPLOw7nMMb2AhfOHI/lNRVC9U2Cp7xofJvC9S6QOCvry+LHECtWGEXfNJGuIsEam1YvRC7SoJ
X-Gm-Message-State: AOJu0YzKRpfLLmLRfp9fBpwSNppUExK6GHRmGH/uCJoGptUorTjCRB3E
	gf2XIv5FsO4jHOOEQtFuTTQFRB+yGhQSk/I2CIXT3CJB/I44suuQ6fM2/KDSwVhUrLRx3Z+pqI2
	RDOx7Yd24VHn+hOvua0/D/Odwi38=
X-Google-Smtp-Source: AGHT+IGXnhXCugXZDWzTqqMcz2DmSHRI/XgexLfnEYCPoZj0QeDS1y/Gs2zevf9iRLZ1IZe2xv1pmV+KQD4StPMk76M=
X-Received: by 2002:a17:906:c152:b0:a77:cdaa:88ab with SMTP id
 a640c23a62f3a-a8366c2fa92mr80675466b.15.1723608617270; Tue, 13 Aug 2024
 21:10:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202407301049.5051dc19-oliver.sang@intel.com> <193e302c-4401-4756-a552-9f1e07ecedcf@redhat.com>
 <439265d8-e71e-41db-8a46-55366fdd334e@intel.com> <90477952-fde2-41d7-8ff4-2102c45e341d@redhat.com>
 <6uxnuf2gysgabyai2r77xrqegb7t7cc2dlzjz6upwsgwrnfk3x@cjj6on3wqm4x>
 <5a67c103-1d9d-440d-8bed-bbfa7d3ecf71@redhat.com> <CAGudoHH4NGgPdTe2yL33TNNFriPM9mVM=0_iuh5dLuesZXQMAQ@mail.gmail.com>
 <5c0979a2-9a56-4284-82d2-42da62bda4a5@redhat.com> <c7e0d029-0a64-4b27-bd62-cf9a3577d7ff@intel.com>
 <wbbieqyyjqy7ulbta6muzepxwxi6galwvhjdxpqaqbeljzpcer@dpeoqrbkl5p2>
 <817150f2-abf7-430f-9973-540bd6cdd26f@intel.com> <CAGudoHG1=p0GEVaSASA1C+iVYbfA5rryozAPPEoxr5uKtM=ghw@mail.gmail.com>
 <f4ddda8d-3513-4471-8609-acb3ce29219e@intel.com>
In-Reply-To: <f4ddda8d-3513-4471-8609-acb3ce29219e@intel.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Wed, 14 Aug 2024 06:10:04 +0200
Message-ID: <CAGudoHECfSYd7EcxiY+soh157m9H4xfU1en=TgX_=QkpbsOFdg@mail.gmail.com>
Subject: Re: [linus:master] [mm] c0bff412e6: stress-ng.clone.ops_per_sec -2.9% regression
To: Yin Fengwei <fengwei.yin@intel.com>
Cc: David Hildenbrand <david@redhat.com>, kernel test robot <oliver.sang@intel.com>, 
	Peter Xu <peterx@redhat.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Matthew Wilcox <willy@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, WANG Xuerui <kernel@xen0n.name>, linux-mm@kvack.org, 
	ying.huang@intel.com, feng.tang@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 5:02=E2=80=AFAM Yin Fengwei <fengwei.yin@intel.com>=
 wrote:
>
> On 8/13/24 03:14, Mateusz Guzik wrote:
> > would you mind benchmarking the change which merely force-inlines _comp=
und_page?
> >
> > https://lore.kernel.org/linux-mm/66c4fcc5-47f6-438c-a73a-3af6e19c3200@r=
edhat.com/
> This change can resolve the regression also:

Great, thanks.

David, I guess this means it would be fine to inline the entire thing
at least from this bench standpoint. Given that this is your idea I
guess you should do the needful(tm)? :)

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> tbox_group/testcase/rootfs/kconfig/compiler/nr_threads/testtime/test/cpuf=
req_governor/debug-setup:
>
> lkp-icl-2sp8/stress-ng/debian-12-x86_64-20240206.cgz/x86_64-rhel-8.3/gcc-=
12/100%/60s/clone/performance/yfw_test2
>
> commit:
>    9cb28da54643ad464c47585cd5866c30b0218e67  parent commit
>    c0bff412e67b781d761e330ff9578aa9ed2be79e  commit introduced regression
>    450b96d2c4f740152e03c6b79b484a10347b3ea9  the change proposed by David
>                                              in above link
>
> 9cb28da54643ad46 c0bff412e67b781d761e330ff95 450b96d2c4f740152e03c6b79b4
> ---------------- --------------------------- ---------------------------
>           %stddev     %change         %stddev     %change         %stddev
>               \          |                \          |                \
>        2906            +3.5%       3007            +0.4%       2919
>    stress-ng.clone.microsecs_per_clone
>      562884            -2.9%     546575            -0.6%     559718
>    stress-ng.clone.ops
>        9295            -2.9%       9028            -0.5%       9248
>    stress-ng.clone.ops_per_sec
>
>
>
> Regards
> Yin, Fengwei
>


--=20
Mateusz Guzik <mjguzik gmail.com>
