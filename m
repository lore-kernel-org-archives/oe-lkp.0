Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793634215;
	b=RTilwBr/GcNby8qTWpxlA4eh+b/6WJoxjKpHAkAWCKFPmpTFNjsheWQ3GKoarpeV4C/J
	 mfS1JmTvEtCoLlwH/Mg172nqJHHBMeLfC8EfVbaa/JXiViB2f+v2C81BDOT+ByGOMsonn
	 1C5ylEXxK6zm/RHcmqwE+q1XXM9GJGqz7dzAdBV4YDda6BmaNrf2d4wYECH8RwyRViDOP
	 H4pHZ+UMwYV8J2+BpXHec5AP2qxMOZ1lw6yxVkXELIm1XZS+N3V5nPTsqiqOTmTsAy7xQ
	 1OEGW15hq4VNb27ywqwrtYyezNFagZVGBBi2ykcXZq7uoHzIkXAbPHaeK/kbWIJoT+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HK8ZrL+fL3c5ivUA8S9idB+tb4oTBF9gPah3Mf4G/bY=;
	b=a5CrvBNMPtOG4lpfwrZmDacM5iXAZugKHpRGNvNCocGgEFCTUo7mCNsd1E0t5wE3mSyp
	 FfKEkCTR88SvOqABLB669XuXPlO8t4wK7Y3ajR3mC69fb7uIPUM1ZHjRdu1wBW22+DN8Z
	 J9noXhOArhN7R2riENFTqN2661aWQUZHaWiMpF1gf+2fauKyOkGZPoCVJ1MgwsA1bELsv
	 ZuSfclf+94+8nhueZSFmBlC7srXEHeThTmZgJGsDLPUuc3toGmFlHWHlmIY5HdvdobBzg
	 7xmcTkc02B4BttmI3hGOAQZpREASClv0iYKUVKBWMciQRlA/AXMNsprgPI8ULiDgOQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qDnv4FZq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F939606D81B
	for <oe-lkp@lists.linux.dev>; Mon,  2 Nov 2026 15:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F939606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qDnv4FZq
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-54492d8a988so446641cf.0
        for <oe-lkp@lists.linux.dev>; Mon, 02 Nov 2026 07:43:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793634214; cv=none;
        d=google.com; s=arc-20260327;
        b=IPrDg7n5+xz0DvW608dgHjpnOr9lrU/nGUWqlA7fqVKbBCPyQFUzITC8W/iJl7Cuix
         Szl6Tcdm7fhC2shaFsDTiXSMnYzKIDX4b73GK5Af/8TLVeKZXARwUMGmSVztI0ZE8LtL
         q/cwVar5bav8VWwf4zuPNb+KnBl4whBBbPXKf3Ij0QpJZobysYbTNcRoJLHkzdSsYOWl
         Xi88thGrYU8xZ8nLLRX8rYoo0fBZSPT/z/xu+Dvd8CrU/dnxBTLpM7UZLHjwuHOzjjtI
         vWzE+88YaF9h+trTLr67AEINyDgW25J8xE/WoR2zNc7pbaXT+nnXDcR5lzdMjhYqksws
         PJjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HK8ZrL+fL3c5ivUA8S9idB+tb4oTBF9gPah3Mf4G/bY=;
        fh=kMMolWafcPuYbXZ5mUwXBCbm5qAPHUhw4KTXWFy1rrg=;
        b=idOQQxt/RK3hhtmu6s0AaswsRMc1k4aQ1Wy5ona1c/WcWe8Jr6LOgBSTdCcWTnISb5
         FJ07f5Hg2Q1gaV/HHoAu7Jf1WJcHU97agGwjfdNWi4rodmZHJIN54yMo5em56pJGkrie
         0UxoPt1iHN6ZdN+iOufOPjbly88CNuQLwqpbaB7UYK2KODsDG8ATtBO3HOWXlIOnXlBp
         08HW49lwKmf896ecafBA+nkGTqMbP8rgB7UJciPxOyX5uER9YX60R1Y7e58ETzWUtomQ
         rXSJ8mn8e9vi/n/yLQGqlp2VBTvibaSmKTc8GyTR9v27ca113S+os2KwyYK9M7sSxyoz
         hL6g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793634214; x=1794239014; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HK8ZrL+fL3c5ivUA8S9idB+tb4oTBF9gPah3Mf4G/bY=;
        b=qDnv4FZqXkIwt1liTI82RhNqDV2hIae1CkftMXieYFH4ZedS9tLC3ihrcvMe+TpHRi
         gCsmWdGqkX9pyAk5tTO5UQ4C2i3dHpVKb9Kx1gMnR7jzAPZKqMjalmyNKv+1y9I/8ce3
         NgirqBhnI+WViKSAwAxj2ZBSC3gMxchyRQopqsoDHkcDXXXAHaFOYTHcvJY4zwC9fqnm
         JEmA4van/7hhJXNP7viBBDgG9HGSkIoUFgLwJdpAzrhDu4T75AdcYQXtzdSCVaD4Tn0W
         cTjmKvc5gl2BBlV7voP/kLQIEMNWXDFAamA5q0SOIQlkBuIg24a9k6rfUwrjXf+S9hmT
         Rf1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634214; x=1794239014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HK8ZrL+fL3c5ivUA8S9idB+tb4oTBF9gPah3Mf4G/bY=;
        b=rA7byfQO5iVVDBSTheRSski40BdB55z+Ae1cviWvAqfVZqPCZJN4FId6cFK1ZXE0nI
         Rkokyb6HnXRSgXop5ftv+YDpQhNrINz0A569LteIRo2PnQ0CsRoO8wT2nQiOVHiFXvl6
         mbRcIcrkjGLEoIWVcBC0Rx33fMa+Ygm+M0zMwZY96wZMfL0OAKcQMODEJVpyfhOQ5P99
         NIeu7cBEcM1K8Fq3nNwaMjTzlD3zQsVohnGFCp87XAFoqaVWT6h3ijwt3dWiZrGSybXw
         LMqkfyEtKJ98YjD10UcN5GMgNC5lyqzWB2X8Xz8WmoNzrkH8vsazCE7wZoaJO3bZbTd/
         y1Iw==
X-Forwarded-Encrypted: i=1; AKwUvByezp9G5j9wGNmv/D+Wi91+JC42CKPPCsRemKrO2vbsfnaBY6Z1k0QWIqvLz4vuGEzx9l7pLVg=@lists.linux.dev
X-Gm-Message-State: APuU4Z896nFZg5GZQBQyTECm0qRDRjahsyh+S9YnR1y+KhiOoFiUHg4g
	0ypnfeD1OuaCkbCbYvR8w6uqe+YOVUbUksY6/vPzgFGJsZ2OXD2Rex0Eo0kmHfTqsZFZ7aQr8CU
	mHREPnztfQcSXfCK30xlNksQVClOi1LrJM4bhgFDh
X-Gm-Gg: AYBFou05nXuW28GCkxNDJGsFSbyvefUzAr1L5HRChGya0mkBjsuSmbfpnlm+h3XneiW
	lD+LoxTFdj8sJv/n6QaziypUP5cMVrji1nGzK+jQTNuU4zJxeo7XceeEWZgXl6+ABjW4/JTY5of
	Qfkj+pQQs0OLUOPEshBSMtr6EG4a+pCIrNYkvHF8k4xsyXTkNSiMS9+nMIWuFSpoTGQ6S+Bc9bX
	AOhmv+dBYFwRoeobD7Oxe29XEpX8RbGItpFIQrkfWVrCYBfZ5wsPNV+Wwo4DE/xqibMpLXQDfkM
	jfwSeq69jR4TKs5EPsZ1PO/142FCZGy1s0YtSfxpFzCW2VbZaZMfFmZGmYxthkj39QXYTeKWskD
	O+8J5FTApGIDqdgwTJ9KWSXV+tV0xy26tlT93
X-Received: by 2002:a05:622a:5148:b0:535:9aa3:5ebb with SMTP id
 d75a77b69052e-5414de19e54mr81585421cf.8.1793634213512; Mon, 02 Nov 2026
 07:43:33 -0800 (PST)
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Post: <mailto:oe-lkp@lists.linux.dev>
List-Help: <mailto:oe-lkp+help@lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-lkp+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261101154503.3203036-1-surenb@google.com> <20261101110100.90796bf33ef50307a7698dca@linux-foundation.org>
In-Reply-To: <20261101110100.90796bf33ef50307a7698dca@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 2 Nov 2026 07:43:17 -0800
X-Gm-Features: AclHuK9i5oa7VVhckAQGYTCIvZrhSt3SBl_wIVecLZ9aaFaoBEyuGC4XsLqeGFo
Message-ID: <CAJuCfpGmPLBRhHa_dmyP10QzyRyvcWMYDLU0+J9t-RCLBsTaWA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] selftests/proc: use RSS in /proc/pid/smaps_rollup
 tearing tests
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@kernel.org, ljs@kernel.org, jannh@google.com, liam@infradead.org, 
	willy@infradead.org, paulmck@kernel.org, pfalcato@suse.de, 
	usama.arif@linux.dev, vbabka@kernel.org, linux-fsdevel@vger.kernel.org, 
	yi1.lai@intel.com, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 11:01=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Sun,  1 Nov 2026 07:45:03 -0800 Suren Baghdasaryan <surenb@google.com>=
 wrote:
>
> > Pss metrics can be affected by map count even if VMA tree stays unchang=
ed,
> > therefore tests checking VMA tree integrity can't use them. Use Rss ins=
tead
> > and pre-populate the VMAs so that Rss changes if a VMA gets skipped or
> > double-counted.
> >
> > To ensure all test VMAs are populated with anonymous pages, remain
> > mergeable across VMA operations, and do not have their Rss changed by
> > memory reclaim:
> > - Toggle PROT_EXEC instead of PROT_WRITE between adjacent test VMAs so
> >   all test VMAs remain writable and MAP_POPULATE faults in anonymous pa=
ges
> >   (rather than the shared zero page, which is not accounted in Rss).
> > - Use mprotect() instead of mmap(..., MAP_FIXED) in split_vma() and
> >   merge_vma() so the first page of the split VMA stays resident.
> >   mprotect(..., PROT_NONE) splits the VMA without unmapping the first p=
age
> >   (pte_present() remains true for PAGE_NONE PTEs), and
> >   mprotect(..., self->mod_info->prot) merges it back. Both parts of the
> >   split VMA retain their non-zero Rss.
> > - Lock all present pages in the child with mlockall(MCL_CURRENT |
> >   MCL_FUTURE | MCL_ONFAULT) so memory pressure cannot reclaim pages and
> >   alter Rss during the test.
> > - In remap_vma(), unlock next_addr before mremap(..., MREMAP_DONTUNMAP)
> >   so next_addr is not split, use mmap(..., MAP_FIXED) in patch_vma() to
> >   merge the middle VMA back into addr, and exclude smaps_rollup tests
> >   from test_maps_tearing_from_remap since remapping moves and unmaps th=
e
> >   page from next_addr.
>
> Thanks.  This is proving tricky.
>
> My evolving reviewbot still isn't happy:
>
> : This fixes the v1 RSS issues, but two things remain.
> :
> : Alternating PROT_EXEC breaks with READ_IMPLIES_EXEC: both mappings
> : become RWX and can merge. A syscall test produced two VMAs instead
> : of 16. Could we populate everything writable, then mprotect the odd
> : mappings read-only? That preserved all 16 VMAs and avoids zero pages.
> :
> : Also, MCL_ONFAULT doesn't bypass RLIMIT_MEMLOCK. If mlockall() fails,
> : the child asserts before CHILD_READY and the parent waits until
> : timeout. Please arrange a coordinated skip for insufficient allowance.

Good point. That part of your fix looks good to me.

> :
> : The patched userspace test passed all six cases on an existing
> : x86-64 6.18.57 kernel, with a PID-namespace adjustment. That kernel
> : predates ca5480fb53fa, so this checks selftest behavior, not the
> : intended kernel's procfs changes. Separate syscall tests on that
> : kernel confirmed the EXEC-merging and memlock failure cases.

I'm guessing your bot was using personality() to make the tests fail.
Again, I'm not sure we should handle such use case. Should we?

>
> I said "no, do it yourself" and it came up with the below.
>
>
>
>
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: selftests/proc: handle personality and memlock constraints
> Date: Sun, 01 Nov 2026 10:55:37 -0800
>
> Alternating PROT_EXEC does not keep the test mappings distinct when
> READ_IMPLIES_EXEC is set: both protection combinations become RWX and
> adjacent mappings can merge, breaking the fixture's layout assumptions.
>
> Populate each mapping writable, then make odd mappings read-only.  This
> retains anonymous pages accounted in RSS while keeping adjacent VMAs
> distinct regardless of READ_IMPLIES_EXEC.  Restore the corresponding
> WRITE-based protection selection in the parent.
>
> Restore the whole three-page destination after remapping, rather than
> replacing only its middle page and relying on the remaining anonymous VMA=
s
> to merge.  The remap test no longer compares RSS.
>
> mlockall(MCL_CURRENT) checks the whole virtual size against the locked
> memory allowance even with MCL_ONFAULT.  An insufficient allowance makes
> the child exit before CHILD_READY, leaving the parent waiting until the
> test times out.
>
> Pass the locking error through the existing shared state and signal
> CHILD_READY on failure.  The parent reaps the child and releases the
> shared state before skipping resource or permission failures.  Check this
> status before opening the child's proc files, as it may already have
> exited.  Unexpected locking errors remain test failures.
>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Jann Horn <jannh@google.com>
> Cc: kernel test robot <yi1.lai@intel.com>
> Cc: Liam R. Howlett <liam@infradead.org>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
> Cc: Paul E. McKenney <paulmck@kernel.org>
> Cc: Pedro Falcato <pfalcato@suse.de>
> Cc: Usama Arif <usama.arif@linux.dev>
> Cc: Vlastimil Babka <vbabka@kernel.org>
> ---
> On top of Suren's v2 "selftests/proc: use RSS in
> /proc/pid/smaps_rollup tearing tests".
>
> Tested the userspace test on an existing x86-64 Linux 6.18.57 kernel,
> using a separate PID-namespace adaptation which is not in this patch:
> - All six cases passed normally and with READ_IMPLIES_EXEC enabled,
>   using DURATION=3D1.
> - All six cases skipped promptly with RLIMIT_MEMLOCK set to 64KiB or
>   zero, exercising ENOMEM and EPERM respectively.
> This does not validate the intended kernel's procfs changes.
>
>  tools/testing/selftests/proc/proc-maps-race.c |   49 +++++++++++-----
>  1 file changed, 36 insertions(+), 13 deletions(-)
>
> --- a/tools/testing/selftests/proc/proc-maps-race.c~proc-maps-race-follow=
up
> +++ a/tools/testing/selftests/proc/proc-maps-race.c
> @@ -174,6 +174,7 @@ typedef bool (*vma_mod_result_check_op)(
>                                         struct line_content *restored_fir=
st_line);
>
>  struct vma_modifier_info {
> +       int mlock_error;
>         int vma_count;
>         void *addr;
>         int prot;
> @@ -696,7 +697,8 @@ static inline bool remap_vma(FIXTURE_DAT
>
>  static inline bool patch_vma(FIXTURE_DATA(proc_maps_race) *self)
>  {
> -       return mmap(self->mod_info->addr + self->page_size, self->page_si=
ze,
> +       /* Replace all three pieces without relying on anon_vma merging. =
*/
> +       return mmap(self->mod_info->addr, self->page_size * 3,
>                     self->mod_info->prot,
>                     MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED, -1, 0) !=3D =
MAP_FAILED;
>  }
> @@ -757,22 +759,31 @@ FIXTURE_SETUP(proc_maps_race)
>         self->pid =3D fork();
>         if (!self->pid) {
>                 /* Child process modifying the address space */
> -               int prot =3D PROT_READ | PROT_WRITE;
>                 int i;
>
>                 for (i =3D 0; i < mod_info->vma_count; i++) {
> -                       mod_info->child_mapped_addr[i] =3D mmap(NULL, sel=
f->page_size * 3, prot,
> +                       mod_info->child_mapped_addr[i] =3D mmap(NULL, sel=
f->page_size * 3,
> +                                       PROT_READ | PROT_WRITE,
>                                         MAP_PRIVATE | MAP_ANONYMOUS | MAP=
_POPULATE, -1, 0);
>                         ASSERT_NE(mod_info->child_mapped_addr[i], MAP_FAI=
LED);
> -                       /* change protection in adjacent maps to prevent =
merging */
> -                       prot ^=3D PROT_EXEC;
> +                       /*
> +                        * Populate writable to get anonymous pages, then=
 alternate
> +                        * write permission even with READ_IMPLIES_EXEC e=
nabled.
> +                        */
> +                       if (i % 2)
> +                               ASSERT_EQ(mprotect(mod_info->child_mapped=
_addr[i],
> +                                                  self->page_size * 3, P=
ROT_READ), 0);
>                 }
>                 /*
>                  * Lock all present pages in memory so memory reclaim can=
not
>                  * change RSS during the test, and use MCL_ONFAULT so
>                  * mremap() expansion does not populate new pages.
>                  */
> -               ASSERT_EQ(mlockall(MCL_CURRENT | MCL_FUTURE | MCL_ONFAULT=
), 0);
> +               if (mlockall(MCL_CURRENT | MCL_FUTURE | MCL_ONFAULT)) {
> +                       mod_info->mlock_error =3D errno;
> +                       signal_state(mod_info, CHILD_READY);
> +                       _exit(0);
> +               }
>                 signal_state(mod_info, CHILD_READY);
>                 wait_for_state(mod_info, PARENT_READY);
>                 while (true) {
> @@ -799,6 +810,21 @@ FIXTURE_SETUP(proc_maps_race)
>                 exit(0);
>         }
>
> +       /* Check setup before opening proc files: the child may have exit=
ed. */
> +       wait_for_state(mod_info, CHILD_READY);
> +       if (mod_info->mlock_error) {
> +               int error =3D mod_info->mlock_error;
> +               int status;
> +
> +               ASSERT_EQ(waitpid(self->pid, &status, 0), self->pid);
> +               pthread_cond_destroy(&mod_info->sync_cond);
> +               pthread_mutex_destroy(&mod_info->sync_lock);
> +               munmap(mod_info, self->shared_mem_size);
> +               if (error =3D=3D ENOMEM || error =3D=3D EPERM || error =
=3D=3D EAGAIN)
> +                       SKIP(return, "Cannot lock test mappings: %s", str=
error(error));
> +               ASSERT_EQ(error, 0);
> +       }
> +
>         switch (self->maps_file) {
>         case MAPS:
>                 sprintf(fname, "/proc/%d/maps", self->pid);
> @@ -815,9 +841,6 @@ FIXTURE_SETUP(proc_maps_race)
>         self->maps_fd =3D open(fname, O_RDONLY);
>         ASSERT_NE(self->maps_fd, -1);
>
> -       /* Wait for the child to map the VMAs */
> -       wait_for_state(mod_info, CHILD_READY);
> -
>         /* Read first two pages */
>         self->page1.data =3D malloc(self->page_size);
>         ASSERT_NE(self->page1.data, NULL);
> @@ -842,10 +865,10 @@ FIXTURE_SETUP(proc_maps_race)
>         for (int i =3D 0; i < mod_info->vma_count; i++) {
>                 if (mod_info->child_mapped_addr[i] =3D=3D (void *)self->l=
ast_line.start_addr) {
>                         mod_info->addr =3D mod_info->child_mapped_addr[i]=
;
> -                       mod_info->prot =3D PROT_READ | PROT_WRITE;
> -                       /* Odd VMAs have exec permission */
> -                       if ((i % 2) !=3D 0)
> -                               mod_info->prot |=3D PROT_EXEC;
> +                       mod_info->prot =3D PROT_READ;
> +                       /* Even VMAs have write permission. */
> +                       if ((i % 2) =3D=3D 0)
> +                               mod_info->prot |=3D PROT_WRITE;
>                 } else if (mod_info->child_mapped_addr[i] =3D=3D (void *)=
self->first_line.start_addr) {
>                         mod_info->next_addr =3D mod_info->child_mapped_ad=
dr[i];
>                 }
> _
>
