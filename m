Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7C119D094
	for <oe-lkp@lists.linux.dev>; Mon, 24 Jun 2024 15:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719244561; cv=none; b=oQODMYy60X/C9v9URqe0anS1GBi1m9p8zYr7veXVKQWctJL1rJVU7yerOvnYffFm48+K8EmAys28/KUYyziyfR2m9Z6fNCYe6jHW7+8Pyv4LAUIl4Hne7sKjpGcKsJ1ZnLU/Sh5Il8gC/KZUH/MRbwF6bMMevwR6nbWWK+CXsKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719244561; c=relaxed/simple;
	bh=B6ewSQHosO2LQ8r+yoQ8Cqbc0dBwA6+lHM2VTS7xLps=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WLti60fcZ/dk4NpIppVoLCQQ/k1hH5OGE/mxeokhuUqPd5H/pUnnr6SK6UOr/Pl6PJmpAlcgJdjp3CstUEBZPVrLOeAqeHRNzCO2VjqldV+8y53f5LJ/DG6nnalz+HkrLaf4GpncdeBH99kIPjrCBtJKUu0VKTi/ol/DseuJQDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mUHSnxBP; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mUHSnxBP"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dfdff9771f8so4130883276.1
        for <oe-lkp@lists.linux.dev>; Mon, 24 Jun 2024 08:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719244559; x=1719849359; darn=lists.linux.dev;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FfWZn1YU3dRvQeweqJc9tWpIC2Gz+zz9bEPN4e86euI=;
        b=mUHSnxBPXF9h/Hkr12+6hpJQl+bFww6LU54KnRRQq5WElXqyOPF1W5ZTbio3/EkwF2
         1DtWWKvAYejksyCluKScBaV41Sty60mKkvaOWdfI4ep4AhN+XutvIU+LSYEeVAb2U3gw
         NatNMyasrKn1dCfHCf2tcV1YSWNHOoz358lzR6PMX1tjD97KV926KhcFUmhJdd43PC9+
         SyvJaOEXNH+rDcSTQ+ROTZTiBQ23mizufq90oOWYJZ+UMVfk9uOwAq2RUE+dPL1cfoqR
         KcLE/i5f7TSwcK8xGZ5L9OMxFAh1mxbf2ZkX0ahQGuoBfMaE4faLoA33IIiLt7VJomQc
         0NnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719244559; x=1719849359;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FfWZn1YU3dRvQeweqJc9tWpIC2Gz+zz9bEPN4e86euI=;
        b=O23aPDJVXReVYOpgUB26W3TCALk0yF3j07aiixobiNfWp8rYQdScEdG08IEBEbiDFA
         bCOrmWiwK1OTIpJIIvWHOmNB0e52P8ViN6YDIDUsgQqi1ScawChEJmx+JK44t324m7W/
         moXgwSwpL5/jS+X8TsSK1YUYMln8dFaQqc4nVMeBysTTMXjEoUCCGh28otjisv67aEO4
         1FNpm7se57FD+widcreR3zbqS96Jd/Pf6c6Gyf4HnV63lfo5tah9yRa7/oHwH1BBGC4B
         J83dUMkE5aciPNGYJf6mNtzS8FGb9xVTq3ti+VKegmY8dMV9dPY1+0b6eFnJz1Uz6SwY
         fanQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIcM7yoPCu/Sj7lTXe3NAQCk2Sxa75xwo4zRbkxxYVzs6I1Y3vRaBPR8WBHgjaeyKpLP9CznUWd72Egz5oPmNvRk1JJwfc
X-Gm-Message-State: AOJu0YzWh/uleMyGdWkceeYpyZs6XV2j1uacQ40jVBJZnFMcxRBn59OH
	56omSwB5+kPTq2FQ/gf5lmqS+4jUXbcEaytdmo7oez99nFl8UawUfVLtQJ4c/LQQI0vI+WwfduH
	BkQ==
X-Google-Smtp-Source: AGHT+IHheq8hSRwWFmH40xtZQpLDRnZQiHV6+dJIKeNGFC+oqjIVbI5vNUIQt9N20C6HOLf/IK/8dA==
X-Received: by 2002:a25:ea42:0:b0:dfe:3de:87a0 with SMTP id 3f1490d57ef6-e0303f5348amr3897252276.24.1719244558581;
        Mon, 24 Jun 2024 08:55:58 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e02e6115bf1sm3286801276.10.2024.06.24.08.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 08:55:57 -0700 (PDT)
Date: Mon, 24 Jun 2024 08:55:46 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Usama Arif <usamaarif642@gmail.com>
cc: Hugh Dickins <hughd@google.com>, Yosry Ahmed <yosryahmed@google.com>, 
    kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
    lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Chengming Zhou <chengming.zhou@linux.dev>, Nhat Pham <nphamcs@gmail.com>, 
    David Hildenbrand <david@redhat.com>, "Huang, Ying" <ying.huang@intel.com>, 
    Johannes Weiner <hannes@cmpxchg.org>, Matthew Wilcox <willy@infradead.org>, 
    Shakeel Butt <shakeel.butt@linux.dev>, Andi Kleen <ak@linux.intel.com>, 
    linux-kernel@vger.kernel.org
Subject: Re: [linux-next:master] [mm] 0fa2857d23:
 WARNING:at_mm/page_alloc.c:#__alloc_pages_noprof
In-Reply-To: <5b3e732c-d23d-41ef-ae5c-947fa3e866ab@gmail.com>
Message-ID: <4b16e2bb-d0af-9a9a-3425-e937f9ecc777@google.com>
References: <202406241651.963e3e78-oliver.sang@intel.com> <CAJD7tkbqHyNUzQg_Qh+-ZryrKtMzdf5RE-ndT+4iURTqEo3o6A@mail.gmail.com> <12fb19d1-3e57-4880-be59-0e83cdc4b7f1@gmail.com> <61d19ec8-2ba7-e156-7bb7-f746dae8e120@google.com>
 <5b3e732c-d23d-41ef-ae5c-947fa3e866ab@gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463770367-863124913-1719244557=:31879"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463770367-863124913-1719244557=:31879
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 24 Jun 2024, Usama Arif wrote:
> On 24/06/2024 18:26, Hugh Dickins wrote:
> > On Mon, 24 Jun 2024, Usama Arif wrote:
> >> On 24/06/2024 15:05, Yosry Ahmed wrote:
> >>> On Mon, Jun 24, 2024 at 1:49=E2=80=AFAM kernel test robot <oliver.san=
g@intel.com>
> >>> wrote:
> >>>>
> >>>> Hello,
> >>>>
> >>>> kernel test robot noticed
> >>>> "WARNING:at_mm/page_alloc.c:#__alloc_pages_noprof" on:
> >>>>
> >>>> commit: 0fa2857d23aa170e5e28d13c467b303b0065aad8 ("mm: store zero pa=
ges
> >>>> to
> >>>> be swapped out in a bitmap")
> >>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git mas=
ter
> >>> This is coming from WARN_ON_ONCE_GFP(order > MAX_PAGE_ORDER, gfp), an=
d
> >>> is triggered by the new bitmap_zalloc() call in the swapon path. For =
a
> >>> sufficiently large swapfile, bitmap_zalloc() (which uses kmalloc()
> >>> under the hood) cannot be used to allocate the bitmap.
> >>>
> >>> Usama, I think we want to use a variant of kvmalloc() here.
> > Yes, I hit the same problem with swapon in my testing,
> > and had been intending to send a patch.
> >
> >> Yes, just testing with below diff now. The patch is not in mm-stable y=
et,
> >> so
> >> will just send another revision with below diff included. Thanks!
> >>
> >>
> >> diff --git a/mm/swapfile.c b/mm/swapfile.c
> >> index 0b8270359bcf..2263f71baa31 100644
> >> --- a/mm/swapfile.c
> >> +++ b/mm/swapfile.c
> >> @@ -2643,7 +2643,7 @@ SYSCALL_DEFINE1(swapoff, const char __user *,
> >> specialfile)
> >>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free_percpu(p->cluster_nex=
t_cpu);
> >>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p->cluster_next_cpu =3D NU=
LL;
> >>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vfree(swap_map);
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitmap_free(p->zeromap);
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kvfree(p->zeromap);
> > Yes.
> >
> >>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kvfree(cluster_info);
> >>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Destroy swap account in=
formation */
> >>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 swap_cgroup_swapoff(p->typ=
e);
> >> @@ -3170,7 +3170,7 @@ SYSCALL_DEFINE2(swapon, const char __user *,
> >> specialfile, int, swap_flags)
> >>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 goto bad_swap_unlock_inode;
> >>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p->zeromap =3D bitmap_zalloc(max=
pages, GFP_KERNEL);
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p->zeromap =3D kvzalloc(DIV_ROUN=
D_UP(maxpages, 8), GFP_KERNEL);
> > No, 8 is not right for 32-bit kernels. I think you want
> > =09p->zeromap =3D kvzalloc(BITS_TO_LONGS(maxpages), GFP_KERNEL);
> > but please check it carefully, I'm easily confused by such conversions.
> >
> > Hugh
>=20
> Ah yes, didnt take into account 32-bit kernel. I think its supposed to be
>=20
> =C2=A0p->zeromap =3D kvzalloc(BITS_TO_LONGS(maxpages) * sizeof(unsigned l=
ong),
> GFP_KERNEL);
>=20
> if using BITS_TO_LONGS.

No doubt you're right (I'm glad I already admitted to being confused).
Personally, I'd just say sizeof(long), but whatever you prefer.

Hugh

>=20
> Will wait sometime incase there are more comments and will send out anoth=
er
> version.
>=20
> Thanks!
>=20
> >>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!p->zeromap) {
> >>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 error =3D -ENOMEM;
> >>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 goto bad_swap_unlock_inode;
---1463770367-863124913-1719244557=:31879--
