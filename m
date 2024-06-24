Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9FA19B3CE
	for <oe-lkp@lists.linux.dev>; Mon, 24 Jun 2024 15:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719242827; cv=none; b=ZxX24upXjXraQHirZyd6Vk9WNdw8OKaxI1wBBNshmrAVAnwqjftrcK7TZM02I4FxLzeNk4TVXBIReVlDVkGhRv5ez63tmvsFJnyWifKWFnUxSx7fRfOk4ncUZJPxcuuJfmmtAIprgofMpAd6ZiFvGIK3uLpkROcpISSls2+G68w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719242827; c=relaxed/simple;
	bh=mZJDkaLe4ItV7kwLQX1qs2ZAs4VlyrhLtGpA7B4NUR8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Qm4tPtW5RMQdzoRoBk9rHuVUwiK1ndeRGCgli7VZYMAHSiP6/Xa1tv0Fxuh3Z5I7T6I59bsvlAMjqn2NDP6df2CZonGvIgWgheeEo7ARI9EhHi6POtYneTGKCppmkC5LKyUPyFbpYjJhd1HzOeYjMxa8zvsGJZloNJc0JwguBFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aPwAYI8r; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aPwAYI8r"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-643f3130ed1so14066217b3.2
        for <oe-lkp@lists.linux.dev>; Mon, 24 Jun 2024 08:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719242825; x=1719847625; darn=lists.linux.dev;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VHhhBBRB8rhuYmKapjgWgpG4+G3I2uB8l3zW0POFr3I=;
        b=aPwAYI8r/haj5abKX9/ZGPvzFIx43z/Pea6qlD82gl2o5NRIo9Dno+Ou6d2tH/f8Lp
         3yOxF2EkEpDW6Xv1zW6jFCRnz8jvL/U8R54qsJ09Bo4+fn5eIlev/j/cdpqUYDxgygoo
         rXHtSwte0QZiTDqbF+i0Ekl1pCBxw9xiXU91AKRcGlqEd3Qtw3SNYQPrSpYpFWw/EbLy
         LK+3/Q5DZRWLuyyTXxmf66rWMZW24VWDfmBc7TF2hV7snaJ5k7EsSOyCLt5w2ozJEmwz
         OIK88a2syWQaGLS2Vlm8H13qdhAdr0t82WJstPGGuTZlfEpgKnANspVUx97enzh2vfar
         U+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719242825; x=1719847625;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VHhhBBRB8rhuYmKapjgWgpG4+G3I2uB8l3zW0POFr3I=;
        b=okz8qmMOsyZZdy1QME1mHq7f+1W2w3WaX+NsrSZsrEKlV8+xqqFgezq6Z+YjHbNyGN
         ggU2t0Wmwgp+WBnbXorH3BpDG70tMZWWiZfbuHx59eLpIPWffykiZe20lwJlY04e0+8W
         G9Ns5A1HP6GigZbye78tPJ0ECqlF8uMSvHp6PN8pK/O9O5fPehxBlBLrCMSLP7icYXQj
         qsmhfymi91RcrPny/CK8Tldft6wmB9a3vo/SJrJXNvZJOjo46puW6iU8SSZt4gUGcodi
         /Ix2hQuO7WF6CwcdgFX/W138+55Wbc0w8zHAoCMjV7mSFk6JtgKbmW5AwiEr6Pd3WKKD
         VhtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMgY8XUNc3H1EcfTQ+OmaZto5fLb+umG6DlgNtDOOJkhbQnK9KZ1cHLQKhKzX9W836tyuAAB62tQZ8FWbYVtLBNeE9GmwM
X-Gm-Message-State: AOJu0YxzhCxgTHPpKW5wSaebuhywUMPJJ4Tigw6k8V0+Cw3cqjeNcXlc
	bpZhwhvz7iGf5YxEPqb978yQQL2W+WPVAoIwjH8aQ+WAddEPZtDlWFP4Y2suIg==
X-Google-Smtp-Source: AGHT+IH0xArOWZLb36B6dJSXuEj4YUKCkqiyL/JUHGGKJMOwiH8NjjpjjnU66Y8zzE+DIobA6DJAIQ==
X-Received: by 2002:a81:b184:0:b0:630:4:5895 with SMTP id 00721157ae682-64299f71455mr40316647b3.24.1719242825030;
        Mon, 24 Jun 2024 08:27:05 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64586546d17sm5790037b3.134.2024.06.24.08.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 08:27:04 -0700 (PDT)
Date: Mon, 24 Jun 2024 08:26:44 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Usama Arif <usamaarif642@gmail.com>
cc: Yosry Ahmed <yosryahmed@google.com>, 
    kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
    lkp@intel.com, Linux Memory Management List <linux-mm@kvack.org>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Chengming Zhou <chengming.zhou@linux.dev>, Nhat Pham <nphamcs@gmail.com>, 
    David Hildenbrand <david@redhat.com>, "Huang, Ying" <ying.huang@intel.com>, 
    Hugh Dickins <hughd@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
    Matthew Wilcox <willy@infradead.org>, 
    Shakeel Butt <shakeel.butt@linux.dev>, Andi Kleen <ak@linux.intel.com>, 
    linux-kernel@vger.kernel.org
Subject: Re: [linux-next:master] [mm] 0fa2857d23:
 WARNING:at_mm/page_alloc.c:#__alloc_pages_noprof
In-Reply-To: <12fb19d1-3e57-4880-be59-0e83cdc4b7f1@gmail.com>
Message-ID: <61d19ec8-2ba7-e156-7bb7-f746dae8e120@google.com>
References: <202406241651.963e3e78-oliver.sang@intel.com> <CAJD7tkbqHyNUzQg_Qh+-ZryrKtMzdf5RE-ndT+4iURTqEo3o6A@mail.gmail.com> <12fb19d1-3e57-4880-be59-0e83cdc4b7f1@gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463770367-265768386-1719242824=:2162"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463770367-265768386-1719242824=:2162
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 24 Jun 2024, Usama Arif wrote:
> On 24/06/2024 15:05, Yosry Ahmed wrote:
> > On Mon, Jun 24, 2024 at 1:49=E2=80=AFAM kernel test robot <oliver.sang@=
intel.com>
> > wrote:
> >>
> >>
> >> Hello,
> >>
> >> kernel test robot noticed
> >> "WARNING:at_mm/page_alloc.c:#__alloc_pages_noprof" on:
> >>
> >> commit: 0fa2857d23aa170e5e28d13c467b303b0065aad8 ("mm: store zero page=
s to
> >> be swapped out in a bitmap")
> >> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git maste=
r
> > This is coming from WARN_ON_ONCE_GFP(order > MAX_PAGE_ORDER, gfp), and
> > is triggered by the new bitmap_zalloc() call in the swapon path. For a
> > sufficiently large swapfile, bitmap_zalloc() (which uses kmalloc()
> > under the hood) cannot be used to allocate the bitmap.
> >
> > Usama, I think we want to use a variant of kvmalloc() here.

Yes, I hit the same problem with swapon in my testing,
and had been intending to send a patch.

>=20
> Yes, just testing with below diff now. The patch is not in mm-stable yet,=
 so
> will just send another revision with below diff included. Thanks!
>=20
>=20
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 0b8270359bcf..2263f71baa31 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -2643,7 +2643,7 @@ SYSCALL_DEFINE1(swapoff, const char __user *,
> specialfile)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free_percpu(p->cluster_next_cp=
u);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p->cluster_next_cpu =3D NULL;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vfree(swap_map);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitmap_free(p->zeromap);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kvfree(p->zeromap);

Yes.

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kvfree(cluster_info);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Destroy swap account inform=
ation */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 swap_cgroup_swapoff(p->type);
> @@ -3170,7 +3170,7 @@ SYSCALL_DEFINE2(swapon, const char __user *,
> specialfile, int, swap_flags)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 goto bad_swap_unlock_inode;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p->zeromap =3D bitmap_zalloc(maxpag=
es, GFP_KERNEL);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p->zeromap =3D kvzalloc(DIV_ROUND_U=
P(maxpages, 8), GFP_KERNEL);

No, 8 is not right for 32-bit kernels. I think you want
=09p->zeromap =3D kvzalloc(BITS_TO_LONGS(maxpages), GFP_KERNEL);
but please check it carefully, I'm easily confused by such conversions.

Hugh

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!p->zeromap) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 error =3D -ENOMEM;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 goto bad_swap_unlock_inode;
---1463770367-265768386-1719242824=:2162--
