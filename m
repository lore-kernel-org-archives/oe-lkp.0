Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A808F134BD
	for <oe-lkp@lists.linux.dev>; Mon, 13 Oct 2025 21:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760391219; cv=none; b=hL+gMQxvXjmpUgDHWAHxxmWPN6ogT1HTrSIWwCfXUA0K/m9c7E1GcFYezWXZxY/osNX+/0Y1Ig5k6bor5Uc/wjPZ+1NyK2mgGLQLRSZFcZcbCZvcOokbWsZYi+auiGPrPwvKYb+hJT5D9bSnoD8RMeOiGOMwjVePZMm8IEWFBzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760391219; c=relaxed/simple;
	bh=KtbfqF6QABNLG4G4ZFBgbcYtAla65oYtsrqmOimMNi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M1o4nVNMVCmZMGw0eTVbFLoMrPHIAOJO2GSAEfhNWUZsEPRWf14AV+O/T8u2SFMdSDjJuuqdVZZU/J1oun8GmAcPE+i0caQmwEpDECqs2FfpPs/0evlB5MIYKMu21dBWXWrXJwzBOggvBUIkEL57x32unGbsuGhSPRwZ7tscH1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QaD6RMrk; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QaD6RMrk"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42568669606so3411213f8f.2
        for <oe-lkp@lists.linux.dev>; Mon, 13 Oct 2025 14:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760391216; x=1760996016; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZUcfu/lY1a0PBj+NQhiKBcjA+Mj4IzkP02rncu56NU=;
        b=QaD6RMrkXOQhPs6iwfa78+4lCLFwByT3VZ3jQNIG4TRO0Vqxnw0hd7R+t2R0FFKq1F
         H/OlPje28dXEMdMrxpmoEaEobLN9hJNFPsSIiLvYOCBAkYc/uS3R1qdXIaiGsRP4vPpI
         ubtw8HSP2yvxzlZsuVMPWfPAswHRnHFkeYDfmH1fX45aGSw9SFPbo6fnDV6VuusisQ9W
         /3l6XNEBMq+U+UXzWSaWgqV11J/F62kT/k9uVTa9KQWLXhERlnGGlTzVnsqc0NPTIPdl
         W9P+WvD2mcf8CH0Y8OuwTDPu8M8x3r5V8kKc5O9dg3CuCf5Yw1Y0Kp3qr2dv8sop9qYK
         KUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760391216; x=1760996016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZUcfu/lY1a0PBj+NQhiKBcjA+Mj4IzkP02rncu56NU=;
        b=w4c9RH0PDJh48pUDnhvkdqJFNI3nW42WLnPI9lCGwPJAZ58p8vV3sF6iPbiGoBF6uf
         vuBSGASX/zzNci3oXOMg9jOgB+90JMSH0D2c9wfAod/qSbuKEwBbz4xGwAzMfoxYtbJy
         rz0QGmRK6P6xGjx1lMM2wG6D/Z94dhvQmhDr1zu+LL6qhjh2W6gFaFYFmkNZYJHryOv6
         SWhxX1IQeqiiGDC/yOk7LXowpw5BWMoNatqobOk5Yk6FExkYJVo6reqktrBvEHFsaw5v
         Va6WdMwXrRC/+fXs0r6y3J4hMGNCemGnpWnkYf+Rf4FTsl1LhsCLJ1zH+W0ZaofhNM/8
         KOnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPaHBLUZCx/dHWeN5x1zRhYAnkOOSvy1Mszjg42awVvVChSQH91Ety2fOY8hcw7q8zK1aj4dE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yze6WGQKn22me85RVl2XRHoa4cVoKqwiZtYQQSca0ZHX9ONzCE+
	wWGHyPcXPwR7gH8VL3vajOLVhJgQ1SI7YWtBJBNoGt+M10QlaVFPhJb3LpnQhup71TTUOu/Eo3E
	WN6lLFiLPg+wgYPK0X4+wblF9mxzJ4gw=
X-Gm-Gg: ASbGncukLqb1UeTB11RBZS4Y4OYW4o9/zWhnAwJpHbk0RasGNd5mK4EOb1h7Usdus3C
	zVs6g53/ZrOP5YwL0St2CLd1KkxTcrN0fNVfN43KOcWg7SyVH2wqIvW2tCWuOs8f5Lr4z+BnvSP
	dPt3B+W4Ss0X5z3ZT5NSGrZZGnz7CgEHEId24TxS7vnj4NCwh92IjndHyGBzf+EXIf2D5qX6jvQ
	VItQrqFLRwqg9V3VrasKJwrZJ4At0iTL6QXerfd6mNccA5TYoaHlFa9VnHIuEkyxO/waw==
X-Google-Smtp-Source: AGHT+IHlObtCjPy8HAxyLJKUgyqBPTd1YCFgsUa+Y+27KX2893URbWswd2YijWA4M7gHzOuw6MrNZ5TM7a4jhudubqU=
X-Received: by 2002:a05:6000:2c0e:b0:408:d453:e40c with SMTP id
 ffacd0b85a97d-4266726d9famr14296862f8f.25.1760391215858; Mon, 13 Oct 2025
 14:33:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202510101652.7921fdc6-lkp@intel.com> <692b6230-db0c-4369-85f0-539aa1c072bb@suse.cz>
In-Reply-To: <692b6230-db0c-4369-85f0-539aa1c072bb@suse.cz>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 13 Oct 2025 14:33:24 -0700
X-Gm-Features: AS18NWDZt8nn8SNzaUniYFQxsv0RyUfuDnFuvS487pngygUdhSUHcYIgCPrXOLo
Message-ID: <CAADnVQJLD7+7aySxv+NtS9LMFgj-O=RhSjkF3b-X3ngwzU2K4Q@mail.gmail.com>
Subject: Re: [linus:master] [slab] af92793e52: BUG_kmalloc-#(Not_tainted):Freepointer_corrupt
To: Vlastimil Babka <vbabka@suse.cz>
Cc: kernel test robot <oliver.sang@intel.com>, Alexei Starovoitov <ast@kernel.org>, oe-lkp@lists.linux.dev, 
	kbuild test robot <lkp@intel.com>, LKML <linux-kernel@vger.kernel.org>, 
	Harry Yoo <harry.yoo@oracle.com>, kasan-dev <kasan-dev@googlegroups.com>, 
	"open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>, linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 7:58=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> On 10/10/25 10:39, kernel test robot wrote:
> >
> >
> > Hello,
> >
> > kernel test robot noticed "BUG_kmalloc-#(Not_tainted):Freepointer_corru=
pt" on:
> >
> > commit: af92793e52c3a99b828ed4bdd277fd3e11c18d08 ("slab: Introduce kmal=
loc_nolock() and kfree_nolock().")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> >
> > [test failed on      linus/master ec714e371f22f716a04e6ecb2a24988c92b26=
911]
> > [test failed on linux-next/master 0b2f041c47acb45db82b4e847af6e17eb66cd=
32d]
> > [test failed on        fix commit 83d59d81b20c09c256099d1c15d7da2196958=
1bd]
> >
> > in testcase: trinity
> > version: trinity-i386-abe9de86-1_20230429
> > with following parameters:
> >
> >       runtime: 300s
> >       group: group-01
> >       nr_groups: 5
> >
> >
> >
> > config: i386-randconfig-012-20251004
> > compiler: gcc-14
> > test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m=
 16G
> >
> > (please refer to attached dmesg/kmsg for entire log/backtrace)
> >
> >
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202510101652.7921fdc6-lkp@inte=
l.com
>
> Does this fix it?
> ----8<----
> From 5f467c4e630a7a8e5ba024d31065413bddf22cec Mon Sep 17 00:00:00 2001
> From: Vlastimil Babka <vbabka@suse.cz>
> Date: Mon, 13 Oct 2025 16:56:28 +0200
> Subject: [PATCH] slab: fix clearing freelist in free_deferred_objects()
>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> ---
>  mm/slub.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/mm/slub.c b/mm/slub.c
> index f9f7f3942074..080d27fe253f 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -6377,15 +6377,16 @@ static void free_deferred_objects(struct irq_work=
 *work)
>                 slab =3D virt_to_slab(x);
>                 s =3D slab->slab_cache;
>
> +
> +               /* Point 'x' back to the beginning of allocated object */
> +               x -=3D s->offset;
>                 /*
>                  * We used freepointer in 'x' to link 'x' into df->object=
s.
>                  * Clear it to NULL to avoid false positive detection
>                  * of "Freepointer corruption".
>                  */
> -               *(void **)x =3D NULL;
> +               set_freepointer(s, x, NULL);
>
> -               /* Point 'x' back to the beginning of allocated object */
> -               x -=3D s->offset;
>                 __slab_free(s, slab, x, x, 1, _THIS_IP_);

Thanks for the fix!
Acked-by: Alexei Starovoitov <ast@kernel.org>

The bot spotted it with CONFIG_SLAB_FREELIST_HARDENED=3Dy.
It wasn't part of my tests. Sorry.
