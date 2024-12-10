Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9781823ED4B
	for <oe-lkp@lists.linux.dev>; Tue, 10 Dec 2024 17:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733851583; cv=none; b=E+KW6DEU2uYN5sPXG33asUQzbEMnZvOtTfKZnPrKSC9P3v+vczux2z5xgrzYOl+/9ViY/iXozhXAdXlpgPbsdLItlEnaTfxxI3ivRqnkJt87pRwSkCCj6GMZqA+dB10IzAqXjwav618PLffwBQ5MSHUwnEOW8ejs7eQRCScLK1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733851583; c=relaxed/simple;
	bh=DpA6KFRqb9+oRRHkWTmXF3+HEm96UVlSKT5sAkSuQFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cpz7u8LkAGv4pcV50mh+uaagVpP1JRyQllUitz+PkKchj/xN2eqLmoDayfCYkL6kAqRI4LRyQvAr623eW6wEzjfNxU30N2H4mCiKmj8sHJT/zUGUecQlp/3vrfWImkqX/4jqMm1GKQj557vVF3tJkwIxrTWXaB+DfsQQle7MbnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P0ugbLAX; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P0ugbLAX"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4674c22c4afso331341cf.1
        for <oe-lkp@lists.linux.dev>; Tue, 10 Dec 2024 09:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733851580; x=1734456380; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDFd+SKOEEjFBffUPwnvhVNjk6zGPKgKf4WnAc+z5zQ=;
        b=P0ugbLAXQ2EdYhG0Y6j40H/h0O7vy9EcZOREBUZp1CyzeQ76vmeThbzBZbvOq8M0c3
         KxmYU4DHFMEG24b8jj5HBAAcDauwMfc8OXZB3+llk9kcaaYmkf1JocbtiuN8Rf26jxb2
         +GorMJsRddstUUXoxfJnZGxOutXygfenLAk9vbGc9hw6vpfRIce6BKpYWYRxbLIEClv7
         Dnnihqgwce7xJeOmpuSt3jn635Y2ZzW80RcUFZRoZNDnlCL0j2yLdCrb9IncFZ7J44g7
         LXBJ8hzCXht4XXre/sZR8nQcOJUTqEsvsLsNTVUQ9rYbTt0x7xPA8UiEwBhkeWixS1DL
         IxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733851580; x=1734456380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDFd+SKOEEjFBffUPwnvhVNjk6zGPKgKf4WnAc+z5zQ=;
        b=IaZFHZDMDs8Bbdkd/vW5SWp72g1RhYsMXptopkabvOOJ5cffbDers7HP7NuAf92kC0
         dOvmxxs/kJdf7jUGmQEuy/5WnyRweKYyD36db4WvRrd91HrBeCqKpGinkaSvUgB5MPpg
         Rebxjalfqv/WnNFwrYZmYi++eLAotBTZV5+W8Y3lGG258OSszliTwpObwnk3T8WONj4B
         9AQjUVD3/eeV8YBHPZrX6HMpS396d73h2bXUCwJL3ZWn6Hqwx0jQQg0cS0Hwm5tf4IND
         qRXYX9cQ4jH94/W6a/6Vr/Zozjg5ngAc4XMhX8y2AJAgWkc2dT2uRNFF10+9JgOD78gz
         4+dQ==
X-Gm-Message-State: AOJu0Yx5lZILbHyfOL6wMd41z007AbG2ZtkGQwakV4swdFzNhe7A6oss
	RYDqEkPceO1ZmAo5VXFI3lsp+DPBEdyQpz+cFO15wYFtUkv5dITGaLD3mUxPesTo4Xn0jcwPgna
	oUE5D0dnRpjS7SCYWzg8XachmbjOj8o7dGbOvLOckZrswmCL4fP/e
X-Gm-Gg: ASbGncsziDEpg4G6by7hDqOSl3EZ73SgSXoEIe530LUGqOJvrXt0Xw3dKLLET2Zx+hc
	04bSLlKTFM2mK9ULnr6MUo5q9cVGzE/IAXI+h4dngK161sXPEKPEAmaIs6KcYHtWuHA==
X-Google-Smtp-Source: AGHT+IGSq/oebMbcl+OhSt16mXBd8VuLF56kIMX/0n4mh7bazuq1+sPTKqIR5Brp1d62OU0GLLIaYhi17cupGVph2Vg=
X-Received: by 2002:a05:622a:5186:b0:466:8a29:9de7 with SMTP id
 d75a77b69052e-46776158637mr5558991cf.12.1733851578862; Tue, 10 Dec 2024
 09:26:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202412082208.db1fb2c9-lkp@intel.com> <CAJuCfpGeKgOgqq69OD-TMoQLhyy+HuTKK=cQPHMY2DgNcJf5Xg@mail.gmail.com>
 <Z1Z5FbBHojF6ywfA@xsang-OptiPlex-9020> <CAJuCfpGqauvtrVVqrf8ge7ba=AB3Jk7daRDdqYzOSxpB462i0w@mail.gmail.com>
 <Z1fwMatrJCZdoEDu@xsang-OptiPlex-9020>
In-Reply-To: <Z1fwMatrJCZdoEDu@xsang-OptiPlex-9020>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 10 Dec 2024 09:26:07 -0800
Message-ID: <CAJuCfpHsPNXFww9jNTHHKFHk_0Fq3UfmDqSEB+1-N-BmrJvo-g@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable] [mm] 85ad413389: BUG:kernel_NULL_pointer_dereference,address
To: Oliver Sang <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Andrew Morton <akpm@linux-foundation.org>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@redhat.com>, David Howells <dhowells@redhat.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Hillf Danton <hdanton@sina.com>, Hugh Dickins <hughd@google.com>, 
	Jann Horn <jannh@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Mateusz Guzik <mjguzik@gmail.com>, Matthew Wilcox <willy@infradead.org>, 
	Mel Gorman <mgorman@techsingularity.net>, Michal Hocko <mhocko@suse.com>, 
	Minchan Kim <minchan@google.com>, Oleg Nesterov <oleg@redhat.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Peter Xu <peterx@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Sourav Panda <souravpanda@google.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 11:39=E2=80=AFPM Oliver Sang <oliver.sang@intel.com>=
 wrote:
>
> hi, Suren,
>
> On Mon, Dec 09, 2024 at 02:20:07PM -0800, Suren Baghdasaryan wrote:
> > On Sun, Dec 8, 2024 at 8:59=E2=80=AFPM Oliver Sang <oliver.sang@intel.c=
om> wrote:
> > >
> > > hi, Suren Baghdasaryan,
> > >
> > > On Sun, Dec 08, 2024 at 06:09:05PM -0800, Suren Baghdasaryan wrote:
> > > > On Sun, Dec 8, 2024 at 7:26=E2=80=AFAM kernel test robot <oliver.sa=
ng@intel.com> wrote:
> > > > >
> > > > >
> > > > >
> > > > > Hello,
> > > > >
> > > > > kernel test robot noticed "BUG:kernel_NULL_pointer_dereference,ad=
dress" on:
> > > > >
> > > > > commit: 85ad413389aec04cfaaba043caa8128b76c6e491 ("mm: make vma c=
ache SLAB_TYPESAFE_BY_RCU")
> > > > > https://git.kernel.org/cgit/linux/kernel/git/akpm/mm.git mm-unsta=
ble
> > > > >
> > > > > in testcase: boot
> > > > >
> > > > > config: i386-randconfig-141-20241208
> > > > > compiler: gcc-11
> > > > > test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -sm=
p 2 -m 16G
> > > > >
> > > > > (please refer to attached dmesg/kmsg for entire log/backtrace)
> > > > >
> > > > >
> > > > > +------------------------------------------------+------------+--=
----------+
> > > > > |                                                | 98d5eefb97 | 8=
5ad413389 |
> > > > > +------------------------------------------------+------------+--=
----------+
> > > > > | BUG:kernel_NULL_pointer_dereference,address    | 0          | 1=
2         |
> > > > > | Oops                                           | 0          | 1=
2         |
> > > > > | EIP:lock_anon_vma_root                         | 0          | 1=
2         |
> > > > > | Kernel_panic-not_syncing:Fatal_exception       | 0          | 1=
2         |
> > > > > +------------------------------------------------+------------+--=
----------+
> > > > >
> > > > >
> > > > > If you fix the issue in a separate patch/commit (i.e. not just a =
new version of
> > > > > the same patch/commit), kindly add following tags
> > > > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > > | Closes: https://lore.kernel.org/oe-lkp/202412082208.db1fb2c9-lk=
p@intel.com
> > > >
> > > > Thanks for the report!
> > > > It looks like anon_vma passed to lock_anon_vma_root() is NULL but i=
t's
> > > > not obvious to me why my patch would cause that.
> > > >
> > > > Oliver, how can I reproduce this locally?
> > > >
> > >
> > > To reproduce:
> > >
> > >         # build kernel
> > >         cd linux
> > >         cp config-6.13.0-rc1-00162-g85ad413389ae .config
> > >         make -j$(nproc) HOSTCC=3Dgcc-11 CC=3Dgcc-11 ARCH=3Di386 oldde=
fconfig prepare modules_prepare bzImage modules
> > >         make -j$(nproc) HOSTCC=3Dgcc-11 CC=3Dgcc-11 ARCH=3Di386 INSTA=
LL_MOD_PATH=3D<mod-install-dir> modules_install
> > >         cd <mod-install-dir>
> > >         find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
> > >
> > >
> > >         git clone https://github.com/intel/lkp-tests.git
> > >         cd lkp-tests
> > >         bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-scr=
ipt is attached in this email
> > >
> > >         # if come across any failure that blocks the test,
> > >         # please remove ~/.lkp and /lkp dir to run from a clean state=
.
> > >
> > >
> > > config and job-script files are attached in original report.
> > >
> > > one thing we want to mention is this seems only reproducible with i38=
6 config in
> > > our tests.
> >
> > Thanks Oliver!
> > I think I found the issue and
> > https://lore.kernel.org/all/20241209221028.1644210-1-surenb@google.com/
> > should fix it. Could you please try it out?
>
> we confirmed the patch fixed the issue we reported. thanks!
>
> Tested-by: kernel test robot <oliver.sang@intel.com>

Thanks!
