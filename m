Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CEE1C700C
	for <oe-lkp@lists.linux.dev>; Sun, 22 Jun 2025 22:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750632658; cv=none; b=nroTy3gl7ji/rq53HAN5IEcirY0YFA3K6JpZaEMLSFwWOB0Y6FmMQMNo2oX/9+frPtkfJyjUUdWdTFvpdFXzFkLgm5mGq8mNbo5LMjMRb+sFoDKwnWNrn+E6kKCla1zbiOwzeWYpdAX33NRW+s/eEq+B1xCQ8lLXgMSOhS9rGWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750632658; c=relaxed/simple;
	bh=glegXgBvIj6/nhiB8cR6JlIJ8F8DQw8vk2YdK4Y46Qs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ry0fUT+MGCgAPRwP8Nd5PrBUC+Z9Bf3AdQpajywQuV+ToReILiOdBJEWHWgR983srL9DRlA9cmgkmeddRjKMiwz0N8GOZiaRmGVvxJrYMKImkqH5Lg/YgRCuzYuuyRnEYu/vSkdCAL8hFqYBM78P8y+4LYGHq8diIBf+tzWvPq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qGmP+neP; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qGmP+neP"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a5ac8fae12so482511cf.0
        for <oe-lkp@lists.linux.dev>; Sun, 22 Jun 2025 15:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750632656; x=1751237456; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCkkmse9j7jIkQr/HtdtMMiFnJZl5VTksMugObu1Hv8=;
        b=qGmP+nePwbG07tzsJWbV03LdOMzkedf5v1I5OBWFUSdRu+UtvYMWY/RCCYuIpTnJje
         beCqtPNk5k31U/WtKXbBZwzmJcy3qNJ9M6BQSN0rujxBtlAF+gd7pvLdC8XEeTEmAJ36
         ocZG2u8MVQY4gzticRHeJIRmk/tL4qS335UuXCgOt16s4lawVWJ4OkCJBRb8PqxTUIy1
         EScT1t+XCrEunA3pff7uqlbaR4PjF5sprBuA58I/w7LgUs5rizs29Q9aKdZoZkvMENSe
         i4u/GdAG7BwGCI+XLlsVQ6i351+yC5tOXfAVq4c5c+4fAcqyC/1w8eBPDIEjg57JpXxU
         i1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750632656; x=1751237456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FCkkmse9j7jIkQr/HtdtMMiFnJZl5VTksMugObu1Hv8=;
        b=PGKS/OSWXwKVCXj+iF0ka/tz6sFKywF4IHF/2j4ji1bZcSd1xxZ8WO7MymR6GKKm3q
         YjGBQ73ZXbGvHbNAq/kRBWr4T0Oh0IroDPTEe6Tue8gbROZFIugBA9ETxzaZOmlsT+6t
         Q0XcCOXvAupVWKesUXDHSNjSY2PTYMAF/V+fDsVBa3p+0Ae9N8cigWkeyO1H6pTu1AT1
         Nh2EaXDu/pPsX9fqie4CK5w0j3daqvkdiARmuEt9e8AlFFH0n8XbtDj16E0wefCN8rgj
         5j+QWYbYYpdu4enwhOA1CQvGT+Vn4RsBCIyf6yel8+I3EKWLPS30FFMNzNdAgR6X0y0l
         N70A==
X-Forwarded-Encrypted: i=1; AJvYcCUAM6Pi3FuJ6s7s0tLX3sJE1lR19bm9apDrSfrybhIbOxN5+huQPpT9DqlYMbUUQuGuhexe0MQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1h2RVsddKIWqifoKVWuYY+yDg5AuYVw8Fe1pgXU0v3VEbyDO1
	ElrlvPezXHI/EfB3NolwyIH0TYoDZTHQlQaZmUnRFnMY9G1IAypOW6poI5yIITAsACKGIi5KzLr
	TK4jgcg5VD6qIbPyg4mjSke9buJ1WOXMRjgSZ/mT7lKDjyVzlA10DK2neY00=
X-Gm-Gg: ASbGncsLhRh628lVxGP8o3mWIJKZTqxKso3KTm2qJEe/uOAKGr1bNew8hv3eViOM9wy
	AH8zRI4GmEp/HA7ymFKRiRWhT29aeLNDDEDvJN+qmA60OZrr5O9tZDv7P3JR7O4+6lfXhjIzg/Y
	vGEItuouirKw6HBOV9tJiRwEoaUGxQwqD7/tvRfHAdiw==
X-Google-Smtp-Source: AGHT+IHVv0cByUMuTtv+78NCbFEK8nCvWjD02fb+bjcGOT1F2fltAhal6PAAqK/gJ767TYT0EG9fKYVyt5sjERXqch8=
X-Received: by 2002:a05:622a:1b0b:b0:479:1958:d81a with SMTP id
 d75a77b69052e-4a7852db91amr5530501cf.6.1750632655398; Sun, 22 Jun 2025
 15:50:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202506181351.bba867dd-lkp@intel.com> <20250620100258.595495-1-00107082@163.com>
In-Reply-To: <20250620100258.595495-1-00107082@163.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 22 Jun 2025 15:50:44 -0700
X-Gm-Features: Ac12FXyniPz2R1npjK7ZfMtWGYaO4vFnkCBjbTvEwI2RPxVobAu7_RLwcpb6AtA
Message-ID: <CAJuCfpFLKR7CqAHG+QjHt4wCLgWmP7dD+f5D8Jx6gHUoXSe1AA@mail.gmail.com>
Subject: Re: CONFIG_TEST_VMALLOC=y conflict/race with alloc_tag_init
To: David Wang <00107082@163.com>
Cc: oliver.sang@intel.com, urezki@gmail.com, ahuang12@lenovo.com, 
	akpm@linux-foundation.org, bhe@redhat.com, hch@infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lkp@intel.com, 
	mjguzik@gmail.com, oe-lkp@lists.linux.dev, harry.yoo@oracle.com, 
	kent.overstreet@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 3:03=E2=80=AFAM David Wang <00107082@163.com> wrote=
:
>
> On Wed, Jun 18, 2025 at 02:25:37PM +0800, kernel test robot wrote:
> >
> > Hello,
> >
> > for this change, we reported
> > "[linux-next:master] [lib/test_vmalloc.c]  7fc85b92db: Mem-Info"
> > in
> > https://lore.kernel.org/all/202505071555.e757f1e0-lkp@intel.com/
> >
> > at that time, we made some tests with x86_64 config which runs well.
> >
> > now we noticed the commit is in mainline now.
>
> > the config still has expected diff with parent:
> >
> > --- /pkg/linux/x86_64-randconfig-161-20250614/gcc-12/7a73348e5d4715b556=
5a53f21c01ea7b54e46cbd/.config   2025-06-17 14:40:29.481052101 +0800
> > +++ /pkg/linux/x86_64-randconfig-161-20250614/gcc-12/2d76e79315e403aab5=
95d4c8830b7a46c19f0f3b/.config   2025-06-17 14:41:18.448543738 +0800
> > @@ -7551,7 +7551,7 @@ CONFIG_TEST_IDA=3Dm
> >  CONFIG_TEST_MISC_MINOR=3Dm
> >  # CONFIG_TEST_LKM is not set
> >  CONFIG_TEST_BITOPS=3Dm
> > -CONFIG_TEST_VMALLOC=3Dm
> > +CONFIG_TEST_VMALLOC=3Dy
> >  # CONFIG_TEST_BPF is not set
> >  CONFIG_FIND_BIT_BENCHMARK=3Dm
> >  # CONFIG_TEST_FIRMWARE is not set
> >
> >
> > then we noticed similar random issue with x86_64 randconfig this time.
> >
> > 7a73348e5d4715b5 2d76e79315e403aab595d4c8830
> > ---------------- ---------------------------
> >        fail:runs  %reproduction    fail:runs
> >            |             |             |
> >            :199         34%          67:200   dmesg.KASAN:null-ptr-dere=
f_in_range[#-#]
> >            :199         34%          67:200   dmesg.Kernel_panic-not_sy=
ncing:Fatal_exception
> >            :199         34%          67:200   dmesg.Mem-Info
> >            :199         34%          67:200   dmesg.Oops:general_protec=
tion_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN
> >            :199         34%          67:200   dmesg.RIP:down_read_trylo=
ck
> >
> > we don't have enough knowledge to understand the relationship between c=
ode
> > change and the random issues. just report what we obsverved in our test=
s FYI.
> >
>
> I think this is caused by a race between vmalloc_test_init and alloc_tag_=
init.
>
> vmalloc_test actually depends on alloc_tag via alloc_tag_top_users, becau=
se when
> memory allocation fails show_mem() would invoke alloc_tag_top_users.
>
> With following configuration:
>
> CONFIG_TEST_VMALLOC=3Dy
> CONFIG_MEM_ALLOC_PROFILING=3Dy
> CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT=3Dy
> CONFIG_MEM_ALLOC_PROFILING_DEBUG=3Dy
>
> If vmalloc_test_init starts before alloc_tag_init, show_mem() would cause
> a NULL deference because alloc_tag_cttype was not init yet.
>
> I add some debug to confirm this theory
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index d48b80f3f007..9b8e7501010f 100644
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -133,6 +133,8 @@ size_t alloc_tag_top_users(struct codetag_bytes *tags=
, size_t count, bool can_sl
>         struct codetag *ct;
>         struct codetag_bytes n;
>         unsigned int i, nr =3D 0;
> +       pr_info("memory profiling alloc top %d: %llx\n", mem_profiling_su=
pport, (long long)alloc_tag_cttype);
> +       return 0;
>
>         if (can_sleep)
>                 codetag_lock_module_list(alloc_tag_cttype, true);
> @@ -831,6 +833,7 @@ static int __init alloc_tag_init(void)
>                 shutdown_mem_profiling(true);
>                 return PTR_ERR(alloc_tag_cttype);
>         }
> +       pr_info("memory profiling ready %d: %llx\n", mem_profiling_suppor=
t, (long long)alloc_tag_cttype);
>
>         return 0;
>  }
>
> When bootup the kernel, the log shows:
>
> $ sudo dmesg -T | grep profiling
> [Fri Jun 20 17:29:35 2025] memory profiling alloc top 1: 0  <--- alloc_ta=
g_cttype =3D=3D NULL
> [Fri Jun 20 17:30:24 2025] memory profiling ready 1: ffff9b1641aa06c0
>
>
> vmalloc_test_init should happened after alloc_tag_init if CONFIG_TEST_VMA=
LLOC=3Dy,
> or mem_show() should check whether alloc_tag is done initialized when cal=
ling
> alloc_tag_top_users

Thanks for reporting!
So, IIUC https://lore.kernel.org/all/20250620195305.1115151-1-harry.yoo@ora=
cle.com/
will address this issue as well. Is that correct?

>
>
>
> David
>
