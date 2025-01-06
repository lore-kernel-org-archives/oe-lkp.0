Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C02E1C6B4
	for <oe-lkp@lists.linux.dev>; Mon,  6 Jan 2025 03:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736133908; cv=none; b=rzd1QwgvyvaAahkifm93pAHRGQgBgy5ok3lTDjPCVZd5AnH+gOdzhFFQjxwRAdoV8/2VL/nx8u0b9AI7ZQlndWq9wWv7VBrLvSvGwwWT2eNEihOr0mKRT1YW8t8NQFosqu3H1Z8rQ3twHO7ayshJ6WY2FNGx7/7iqvGj5UoegbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736133908; c=relaxed/simple;
	bh=41AAFZgDZIZZn9RfZjpSZBHdG0oRXvgFwHi2gPWys1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fpV9tzbIFCqjJ6ATch4RcoCkRGlflVJeBThkffJ7F2pYIwW5x89ToFdTXIOoUQb/8id94AXBLdJkXgJdQfgEAbdk3Wjuo6l07BjxX7sGOXCrxPG0/p7xaFsyNzO3zHCg9pc8ynOts/7vlBjr5723w+2Pkwr2IN1empGMJPOlXog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GYNG8/gX; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GYNG8/gX"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21644aca3a0so12929575ad.3
        for <oe-lkp@lists.linux.dev>; Sun, 05 Jan 2025 19:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736133906; x=1736738706; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qwu0CGLfx4PBv0aP19byG7/qRPpn0POPKp0Znpy+smk=;
        b=GYNG8/gXpTxWKWvrKct995kaFcmAbHOq7DkXuv0Hx20awKULtGysVhVNV0DuosgyZW
         BgiZCZltLUZG3t2y0VUv0eWQrfMJPw4tKahgVlJBiEF3QvbRqZrjo3Ga5qpZHpoyOmNT
         1ckI7JG1r3i1GXZ3zAeZ3mepYBwrTlDNFxzmcsth3Hq9gRlC/YCyG3vmyuE1Y8eh85wD
         RhOYEg37Ez+YWw5Hx/xJTaExTLSkK012yklVCA7TrWvNURtTCPQ0iWui3qarq4sG9I34
         PNaC82AVvD2E4rsYKujnjo5SqUMSd3dKVQKvzgdxRyGXdIQX0lCgt4r6L/htnWSq8Qvj
         j0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736133906; x=1736738706;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qwu0CGLfx4PBv0aP19byG7/qRPpn0POPKp0Znpy+smk=;
        b=joWC3vzDYUy+lRDRVkYUan/ZNyStOrQSxdTSO92xU6o44cJya3JUNYNnCKu2nfDa8+
         XvPyz3bN3HBSfueL0vajEl3AkAbh53NAl1oMaeg+pulsl7qs22cudwQxtTtL25pbBs5K
         hhMuiBJEux/Y53fKbx4iOa6R4+VXrCmA8Kd6spP6P4E8euuho2oATMEObozP5M25Jdim
         ibGJSWjJMTYdGUlmVUacFeX5Fo9XWaMQSAGkbI5qCj/7nl0Ft3je1HWDgkxqRfnKCYQz
         AO6aLU3Nf0/wny0sRfNXFUOwyHOdeYCxOElD55HgBeY71+EjGeIIZwZ0ASPnDWelJmqu
         vKvA==
X-Forwarded-Encrypted: i=1; AJvYcCWa54uX9Jo2O+OJQbcXYo//qUrAi2mYW2EeLWGf2Tfj3RvrDIAQuWR3gpUB2RW9lF3mUzm4ne4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHn+dNaHX23NAkr8KXWHLMAQ/VU57LF/qHY4Vot8K7Asiy5lEG
	D5mSvyJkQmMQWa6PWuF0VuwTCthaiNgbI/1NDig96ECQlZpVp4MoVf+YWkY2w9r1ooud47pE5q+
	/lPg5NlEdtIuFbZpbBZJye57aNTatrXB9KZWDyg==
X-Gm-Gg: ASbGncs9iSC8sv0bffinxJ5XvOcudnJmOIs9tgZxP9tE6FzHT8yb7jjWmXLwxcNTQ0k
	tfdYArLk7PR2oDhacl0KgkiOULWIXi6QWjRvhlHU=
X-Google-Smtp-Source: AGHT+IEd9uX8m62UbCkIiqMruS24B5gEb7kpnbKEoxfd8QD3vky/MOHt+yDs5UgtyZvPgih7cjAnP+84f7NsF2hO8po=
X-Received: by 2002:a17:902:e5c7:b0:215:bf1b:a894 with SMTP id
 d9443c01a7336-219e6eb5bffmr826923375ad.24.1736133905685; Sun, 05 Jan 2025
 19:25:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202412311203.ca7bddba-lkp@intel.com> <CALm+0cWOxUm_hrNe4UP4Z-vyr4RCOw+dc=kCBTgsyjHFHiHDsg@mail.gmail.com>
 <949f6251-d411-45ef-9f85-d5d069b90b0e@paulmck-laptop> <Z3Ym/DDtGOPamGjZ@xsang-OptiPlex-9020>
 <c8c4c6d6-ad52-4cd2-ba1f-c442da4432af@paulmck-laptop> <CALm+0cVbaJuMWMkU4g_6inCKiBVaVD3iixvBrfMJTqZ-3OUCvg@mail.gmail.com>
 <c2561f0c-9bc1-4492-b9dd-655502f101f7@paulmck-laptop>
In-Reply-To: <c2561f0c-9bc1-4492-b9dd-655502f101f7@paulmck-laptop>
From: Z qiang <qiang.zhang1211@gmail.com>
Date: Mon, 6 Jan 2025 11:24:54 +0800
Message-ID: <CALm+0cWoK_+xMxZ1xddZGt9KxuUqkW13fqwtOm9NtBEd+LqBFQ@mail.gmail.com>
Subject: Re: [paulmckrcu:dev.2024.12.24a] [srcu] 9216c28c6a: BUG:unable_to_handle_page_fault_for_address
To: paulmck@kernel.org
Cc: Oliver Sang <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> On Fri, Jan 03, 2025 at 01:50:50PM +0800, Z qiang wrote:
> > >
> > > On Thu, Jan 02, 2025 at 01:41:16PM +0800, Oliver Sang wrote:
> > > > hi, Zqiang, hi, Paul,
> > > >
> > > > On Tue, Dec 31, 2024 at 08:19:44AM -0800, Paul E. McKenney wrote:
> > > > > On Tue, Dec 31, 2024 at 03:16:25PM +0800, Z qiang wrote:
> > > >
> > > > [...]
> > > >
> > > > > > >
> > > > > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > > > > the same patch/commit), kindly add following tags
> > > > > > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > > > > | Closes: https://lore.kernel.org/oe-lkp/202412311203.ca7bddba-lkp@intel.com
> > > > > > >
> > > > > >
> > > > > > Please try the following modifications:
> > > >
> > > > yes, the following modifications fix the issues we found for 9216c28c6a. thanks!
> > > >
> > > > Tested-by: kernel test robot <oliver.sang@intel.com>
> > >
> > > Thank you, and I will apply this during my next rebase.
> > >
> > > Zqiang, unless you tell me otherwise, I will add your Co-developed-by
> > > and Signed-off-by.
> > >
> > > Either way, Happy Square New Year!
> >
> > Thank you,  Happy New Year!  :)
>
> And here you go!  Please let me know of anything I missed.
>
> And thank you for saving me the time it would have taken to track
> this one down.  ;-)
>
>                                                         Thanx, Paul
>
> ------------------------------------------------------------------------
>
> commit 71c893e6d1857d1e4ea37aec557d734a560fdb39
> Author: Paul E. McKenney <paulmck@kernel.org>
> Date:   Thu Dec 19 16:08:54 2024 -0800
>
>     srcu: Make SRCU readers use ->srcu_ctrs for counter selection
>
>     This commit causes SRCU readers to use ->srcu_ctrs for counter
>     selection instead of ->srcu_idx.  This takes another step towards
>     array-indexing-free SRCU readers.
>
>     [ paulmck: Apply kernel test robot feedback. ]
>
>     Co-developed-by: Z qiang <qiang.zhang1211@gmail.com>
>     Signed-off-by: Z qiang <qiang.zhang1211@gmail.com>
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
>     Tested-by: kernel test robot <oliver.sang@intel.com>
>
> diff --git a/include/linux/srcutree.h b/include/linux/srcutree.h
> index c794d599db5c1..1b01ced61a45b 100644
> --- a/include/linux/srcutree.h
> +++ b/include/linux/srcutree.h
> @@ -101,6 +101,7 @@ struct srcu_usage {
>   */
>  struct srcu_struct {
>         unsigned int srcu_idx;                  /* Current rdr array element. */
> +       struct srcu_ctr __percpu *srcu_ctrp;
>         struct srcu_data __percpu *sda;         /* Per-CPU srcu_data array. */
>         struct lockdep_map dep_map;
>         struct srcu_usage *srcu_sup;            /* Update-side data. */
> @@ -167,6 +168,7 @@ struct srcu_struct {
>  #define __SRCU_STRUCT_INIT(name, usage_name, pcpu_name)                                                \
>  {                                                                                              \
>         .sda = &pcpu_name,                                                                      \
> +       .srcu_ctrp = &pcpu_name.srcu_ctrs[0],                                                   \
>         __SRCU_STRUCT_INIT_COMMON(name, usage_name)                                             \
>  }
>
> @@ -222,13 +224,12 @@ void srcu_torture_stats_print(struct srcu_struct *ssp, char *tt, char *tf);
>   */
>  static inline int __srcu_read_lock_lite(struct srcu_struct *ssp)
>  {
> -       int idx;
> +       struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
>
>         RCU_LOCKDEP_WARN(!rcu_is_watching(), "RCU must be watching srcu_read_lock_lite().");
> -       idx = READ_ONCE(ssp->srcu_idx) & 0x1;
> -       this_cpu_inc(ssp->sda->srcu_ctrs[idx].srcu_locks.counter); /* Y */
> +       this_cpu_inc(scp->srcu_locks.counter); /* Y */
>         barrier(); /* Avoid leaking the critical section. */
> -       return idx;
> +       return scp - &ssp->sda->srcu_ctrs[0];
>  }
>
>  /*
> diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
> index d7ee2f345e192..3bf7f41ad72b8 100644
> --- a/kernel/rcu/srcutree.c
> +++ b/kernel/rcu/srcutree.c
> @@ -253,8 +253,10 @@ static int init_srcu_struct_fields(struct srcu_struct *ssp, bool is_static)
>         atomic_set(&ssp->srcu_sup->srcu_barrier_cpu_cnt, 0);
>         INIT_DELAYED_WORK(&ssp->srcu_sup->work, process_srcu);
>         ssp->srcu_sup->sda_is_static = is_static;
> -       if (!is_static)
> +       if (!is_static) {
>                 ssp->sda = alloc_percpu(struct srcu_data);
> +               ssp->srcu_ctrp = &ssp->sda->srcu_ctrs[0];
> +       }
>         if (!ssp->sda)
>                 goto err_free_sup;

ssp->srcu_ctrp should be assigned a value under the condition that
ssp->sda is  allocated successfully.

-       if (!is_static) {
+       if (!is_static)
                ssp->sda = alloc_percpu(struct srcu_data);
-               ssp->srcu_ctrp = &ssp->sda->srcu_ctrs[0];
-       }
        if (!ssp->sda)
                goto err_free_sup;
+       if (!is_static)
+               ssp->srcu_ctrp = &ssp->sda->srcu_ctrs[0];



>         init_srcu_struct_data(ssp);
> @@ -742,12 +744,11 @@ EXPORT_SYMBOL_GPL(__srcu_check_read_flavor);
>   */
>  int __srcu_read_lock(struct srcu_struct *ssp)
>  {
> -       int idx;
> +       struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
>
> -       idx = READ_ONCE(ssp->srcu_idx) & 0x1;
> -       this_cpu_inc(ssp->sda->srcu_ctrs[idx].srcu_locks.counter);
> +       this_cpu_inc(scp->srcu_locks.counter);
>         smp_mb(); /* B */  /* Avoid leaking the critical section. */
> -       return idx;
> +       return scp - &ssp->sda->srcu_ctrs[0];
>  }
>  EXPORT_SYMBOL_GPL(__srcu_read_lock);
>
> @@ -772,13 +773,11 @@ EXPORT_SYMBOL_GPL(__srcu_read_unlock);
>   */
>  int __srcu_read_lock_nmisafe(struct srcu_struct *ssp)
>  {
> -       int idx;
> -       struct srcu_data *sdp = raw_cpu_ptr(ssp->sda);
> +       struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);

Should this be the case?

struct srcu_ctr  *scp = raw_cpu_ptr(ssp->srcu_ctrp);

>
> -       idx = READ_ONCE(ssp->srcu_idx) & 0x1;
> -       atomic_long_inc(&sdp->srcu_ctrs[idx].srcu_locks);
> +       atomic_long_inc(&scp->srcu_locks);
>         smp_mb__after_atomic(); /* B */  /* Avoid leaking the critical section. */
> -       return idx;
> +       return scp - &ssp->sda->srcu_ctrs[0];
>  }
>  EXPORT_SYMBOL_GPL(__srcu_read_lock_nmisafe);
>
> @@ -1152,6 +1151,8 @@ static void srcu_flip(struct srcu_struct *ssp)
>         smp_mb(); /* E */  /* Pairs with B and C. */
>
>         WRITE_ONCE(ssp->srcu_idx, ssp->srcu_idx + 1); // Flip the counter.
> +       WRITE_ONCE(ssp->srcu_ctrp,
> +                  &ssp->sda->srcu_ctrs[!(ssp->srcu_ctrp - &ssp->sda->srcu_ctrs[0])]);
>
>         /*
>          * Ensure that if the updater misses an __srcu_read_unlock()
> @@ -1998,6 +1999,7 @@ static int srcu_module_coming(struct module *mod)
>         for (i = 0; i < mod->num_srcu_structs; i++) {
>                 ssp = *(sspp++);
>                 ssp->sda = alloc_percpu(struct srcu_data);
> +               ssp->srcu_ctrp = &ssp->sda->srcu_ctrs[0];
>                 if (WARN_ON_ONCE(!ssp->sda))
>                         return -ENOMEM;


-               ssp->srcu_ctrp = &ssp->sda->srcu_ctrs[0];
                if (WARN_ON_ONCE(!ssp->sda))
                        return -ENOMEM;
+               ssp->srcu_ctrp = &ssp->sda->srcu_ctrs[0];


Thanks
Zqiang

>         }
