Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C225016CD1E;
	Mon, 22 Jul 2024 17:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721670476; cv=none; b=d5R+esfS3nU/M1FKt43gZIYgESnMOr5WmHaemNLSGPScbDHj/tWeBkWUT3c9Y9vKpZFDfI5Pj76RTCvK0Yzi463zIafyNR3KSyyoZe3yGk3pI1YsgG2gI9U9KeQDoiqHwKmKHvZRvzmtNXcWGWdJX4+n0LkGO+c/AeSLf02YuRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721670476; c=relaxed/simple;
	bh=dYweHWEvREtJTac+MMTBYVKSavgQcaBV+zTixFvWOfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TO/+E8mEGMnxyJyyx+IcDRilho5dNHkxwWj2+FKUg3w0WNSXDdR5c2VbfqlHr1dXnLfwGGhhHxIMlITE0nPTgMEjZjOR+gJr+v6BxtwJR7ltz+s5oRzKBttvQFpVONW2/HKO9XEl1tsYjtBG9okEWZ8Xk7cQiD+LNu38ErQTv7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJm4pq8q; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJm4pq8q"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-4f5153a3a73so840048e0c.2;
        Mon, 22 Jul 2024 10:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721670473; x=1722275273; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ANlfruZmo4l7ccwD2B2KKiZpD4Y7MpMXUEVtTMzZJI=;
        b=PJm4pq8qi1S0bHKEs+0oF/DkrLijMPXCDBFDHuBqs3XDDhz6L0LkatR+GtbrcvMyMZ
         MNfYJDahwJxmzgnv6eKao4FAOnr51tU7JVLm3P3PzduvucfmD9WA9IhHJONeT13MXxv8
         4LNYsu7wbRDOT1/araMrr5GMRJf68/tYug4a0GpgiyZpNjTIbDMqVbUdlowrvclJ8ej/
         82D/VM10Gp9HJhbrmDMkTLhm3H6BllhCLBZUVtNbTG6YbXW+2ggtExofOHsvs+fm3MsF
         nFJwLxm7ImtfhPW7khdeJFKzUtl93fibt2olvCU43ryNihUCkX02CTxk1iUjhDw/1tSX
         bHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721670473; x=1722275273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ANlfruZmo4l7ccwD2B2KKiZpD4Y7MpMXUEVtTMzZJI=;
        b=ZV8uBxYThilHjp3DNaqJhvfJE5F/fYUKz9KGwO5p1ai6pMr1fw8FYII0VwRHto/uWt
         c5g++Rnlgi5vdyuur+fl8nR/o43jByrJ39no/LMhRY1OzqnKusTreoOsCAPd4IoDQiWM
         Py1PdfkpbSfZndqmPvYTPGEPW+8zgYt/JwFyVrwIdEY2tZGdIgaCc1iZKXqXK7lBEToa
         KHGitFRnUUmsy1VNf7wGcnM9VGFo6+LqQGztJWfO29cDEaaWKNn+7JZxhNU39aycO61V
         I6RjRuWtviuQt+pn41ccD1/b6tZM44JLpP5JIUd0t698NcI4FZOOxIWgD3MyDLm8GW6U
         WzXA==
X-Forwarded-Encrypted: i=1; AJvYcCXrWBxqB/oE5aKPieNOXA5NIpJiT+PqZJ6p8zPg50CR+l75YeRAztkmaW/jqDXtj6E3zhjxcamM6zUDZSHlvx6N6aYGK258qYOYct4bfDraIEG22BTNm0Airbq9JA==
X-Gm-Message-State: AOJu0YwsziCOQ/WjS0nPZXvhr8VTUW1A2VJn2rfoLaZeFSmMd1PUDWsh
	JPhTg7iNWkD9tAS5g5Wol9U/Ku7gR4gdbgmeyzpUmb55b8573uf2
X-Google-Smtp-Source: AGHT+IGaojxqHxb5zQdMj/U7MB7QnqT/LcZ56HsdbQYnOJUSYoy0tjW0By+nVVAUk0K46UfhYyWndQ==
X-Received: by 2002:a05:6122:4597:b0:4f5:1ea3:736f with SMTP id 71dfb90a1353d-4f51ea386eemr4706788e0c.13.1721670473446;
        Mon, 22 Jul 2024 10:47:53 -0700 (PDT)
Received: from fauth2-smtp.messagingengine.com (fauth2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a199013905sm382964385a.67.2024.07.22.10.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 10:47:52 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfauth.nyi.internal (Postfix) with ESMTP id DC79E1200066;
	Mon, 22 Jul 2024 13:47:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 22 Jul 2024 13:47:49 -0400
X-ME-Sender: <xms:RZueZmPUZfUpcM2r7hSpiRCl4Tci8j0HQAsElCET3v8dQecFWgLQdQ>
    <xme:RZueZk98ZuYkVzkL4VufYWP0nWEYAwNfizbmeagXUC8ASrTBdpOi3RW6lIFq8Q265
    ciiP2WBAWkv62ANew>
X-ME-Received: <xmr:RZueZtQ_hj9tT5gZRVbfn1CxQEAiGY6pwZlo3VK80xdomBK0KPuc2bAagYpbPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrheejgdduudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhu
    nhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrg
    htthgvrhhnpefhtedvgfdtueekvdekieetieetjeeihedvteehuddujedvkedtkeefgedv
    vdehtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhh
    phgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunh
    drfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:RZueZmsR1Z10nCLZbrKXRaqHntPu9x7O1bKRX1Iksa9RoAuhZwD0mQ>
    <xmx:RZueZudQRrbvhzmRoIbbWcazaixF8-IiXkpc08qbim-ARm4JRjm_dg>
    <xmx:RZueZq2YejBQZ_CQCRNwl4xT5b-IdNmub4igl7fW-0PvH2ftlzxi9Q>
    <xmx:RZueZi8BeAEoRxvuf19WYgetJWlPBptScAUqNzjMJu1bsthMhBdq1w>
    <xmx:RZueZt-HLVPNg4trOSqYzNN1v2QHOBnT_Ijt26Fp09INLS6FX3FVbSnK>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Jul 2024 13:47:48 -0400 (EDT)
Date: Mon, 22 Jul 2024 10:47:30 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: Suren Baghdasaryan <surenb@google.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Kees Cook <keescook@chromium.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Benno Lossin <benno.lossin@proton.me>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Christoph Lameter <cl@linux.com>, Dennis Zhou <dennis@kernel.org>,
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Wedson Almeida Filho <wedsonaf@gmail.com>, linux-mm@kvack.org,
	lkmm@lists.linux.dev
Subject: Re: [linus:master] [mm]  24e44cc22a:
 BUG:KCSAN:data-race_in_pcpu_alloc_noprof/pcpu_block_update_hint_alloc
Message-ID: <Zp6bMoDnUMxNrKos@boqun-archlinux>
References: <202407191651.f24e499d-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202407191651.f24e499d-oliver.sang@intel.com>

On Mon, Jul 22, 2024 at 03:30:01PM +0800, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "BUG:KCSAN:data-race_in_pcpu_alloc_noprof/pcpu_block_update_hint_alloc" on:
> 
> commit: 24e44cc22aa3112082f2ee23137d048c73ca96d5 ("mm: percpu: enable per-cpu allocation tagging")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> 
> [test failed on linus/mater       68b59730459e5d1fe4e0bbeb04ceb9df0f002270]
> [test failed on linux-next/master 73399b58e5e5a1b28a04baf42e321cfcfc663c2f]
> 
> in testcase: trinity
> version: trinity-i386-abe9de86-1_20230429
> with following parameters:
> 
> 	runtime: 300s
> 	group: group-04
> 	nr_groups: 5
> 
> 
> 
> compiler: gcc-13
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> as we understand, this commit is not the root-cause of KCSAN issue, just make
> the issue change from form (1) to (2). furthermore, we don't understand why
> the issue happens randomly. but we failed to bisect the issue (1). so we just
> make out this report FYI, not sure if it could supply some hints to any real
> issues.
> 
> 60fa4a9e23231721 24e44cc22aa3112082f2ee23137
> ---------------- ---------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>         281:999        -28%            :998   dmesg.BUG:KCSAN:data-race_in_pcpu_alloc/pcpu_block_update_hint_alloc   <--- (1)
>         296:999        -30%            :998   dmesg.BUG:KCSAN:data-race_in_pcpu_alloc/pcpu_block_update_hint_free
>          25:999         -3%            :998   dmesg.BUG:KCSAN:data-race_in_pcpu_alloc/pcpu_chunk_populated
>            :999         29%         292:998   dmesg.BUG:KCSAN:data-race_in_pcpu_alloc_noprof/pcpu_block_update_hint_alloc   <---(2)
>            :999         27%         269:998   dmesg.BUG:KCSAN:data-race_in_pcpu_alloc_noprof/pcpu_block_update_hint_free
>            :999          4%          44:998   dmesg.BUG:KCSAN:data-race_in_pcpu_alloc_noprof/pcpu_chunk_populated
> 
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202407191651.f24e499d-oliver.sang@intel.com
> 
> 
> 
> [  117.357897][ T3648] ==================================================================
> [  117.358568][ T3648] BUG: KCSAN: data-race in pcpu_alloc_noprof / pcpu_block_update_hint_alloc
> [  117.359222][ T3648]
> [  117.359424][ T3648] write to 0xffffffff8559e600 of 4 bytes by task 3653 on cpu 1:
> [ 117.360048][ T3648] pcpu_block_update_hint_alloc (mm/percpu.c:602 mm/percpu.c:598 mm/percpu.c:923) 
> [ 117.360554][ T3648] pcpu_alloc_area (mm/percpu.c:1260) 
> [ 117.360960][ T3648] pcpu_alloc_noprof (mm/percpu.c:1835) 
> [ 117.361393][ T3648] bpf_map_alloc_percpu (kernel/bpf/syscall.c:466) 
> [ 117.361825][ T3648] prealloc_init (kernel/bpf/hashtab.c:338) 
> [ 117.362211][ T3648] htab_map_alloc (kernel/bpf/hashtab.c:573) 
> [ 117.362618][ T3648] map_create (kernel/bpf/syscall.c:1320) 
> [ 117.362987][ T3648] __sys_bpf (kernel/bpf/syscall.c:5642) 
> [ 117.363348][ T3648] __ia32_sys_bpf (kernel/bpf/syscall.c:5765) 
> [ 117.363738][ T3648] ia32_sys_call (kbuild/obj/consumer/x86_64-randconfig-013-20240713/./arch/x86/include/generated/asm/syscalls_32.h:358) 
> [ 117.364151][ T3648] do_int80_emulation (arch/x86/entry/common.c:165 (discriminator 1) arch/x86/entry/common.c:253 (discriminator 1)) 
> [ 117.364578][ T3648] asm_int80_emulation (arch/x86/include/asm/idtentry.h:626) 
> [  117.365004][ T3648]
> [  117.365203][ T3648] read to 0xffffffff8559e600 of 4 bytes by task 3648 on cpu 0:
> [ 117.365797][ T3648] pcpu_alloc_noprof (mm/percpu.c:1894) 
> [ 117.366210][ T3648] bpf_map_alloc_percpu (kernel/bpf/syscall.c:466) 
> [ 117.366627][ T3648] prealloc_init (kernel/bpf/hashtab.c:338) 
> [ 117.367000][ T3648] htab_map_alloc (kernel/bpf/hashtab.c:573) 
> [ 117.367400][ T3648] map_create (kernel/bpf/syscall.c:1320) 
> [ 117.367766][ T3648] __sys_bpf (kernel/bpf/syscall.c:5642) 
> [ 117.368120][ T3648] __ia32_sys_bpf (kernel/bpf/syscall.c:5765) 
> [ 117.368503][ T3648] ia32_sys_call (kbuild/obj/consumer/x86_64-randconfig-013-20240713/./arch/x86/include/generated/asm/syscalls_32.h:358) 
> [ 117.368907][ T3648] do_int80_emulation (arch/x86/entry/common.c:165 (discriminator 1) arch/x86/entry/common.c:253 (discriminator 1)) 
> [ 117.369341][ T3648] asm_int80_emulation (arch/x86/include/asm/idtentry.h:626) 
> [  117.369761][ T3648]
> [  117.369968][ T3648] value changed: 0x00000003 -> 0x00000000
> [  117.370454][ T3648]
> [  117.370662][ T3648] Reported by Kernel Concurrency Sanitizer on:
> [  117.371179][ T3648] CPU: 0 PID: 3648 Comm: trinity-c2 Not tainted 6.9.0-rc4-00089-g24e44cc22aa3 #1
> [  117.371943][ T3648] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> [  117.372811][ T3648] ==================================================================
> 

This looks like a data race because we read pcpu_nr_empty_pop_pages out
of the lock for a best effort checking, @Tejun, maybe you could confirm
on this?

If so, a fix could be as the follow, i.e. telling KCSAN that the data
race is expected. Another fix is making all accesses to
pcpu_nr_empty_pop_pages atomics (via WRITE_ONCE() and READ_ONCE()).

Regards,
Boqun

(is there a way to tell the bot to issue a rerun with a diff? ;-))

------------------------>8
diff --git a/mm/percpu.c b/mm/percpu.c
index 20d91af8c033..0626ef12099b 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -1891,7 +1891,12 @@ void __percpu *pcpu_alloc_noprof(size_t size, size_t align, bool reserved,
                mutex_unlock(&pcpu_alloc_mutex);
        }

-       if (pcpu_nr_empty_pop_pages < PCPU_EMPTY_POP_PAGES_LOW)
+       /*
+        * Checks pcpu_nr_empty_pop_pages out of the pcpu_lock, data races may
+        * occur but this is just a best-effort checking, everything is synced
+        * in pcpu_balance_work.
+        */
+       if (data_race(pcpu_nr_empty_pop_pages) < PCPU_EMPTY_POP_PAGES_LOW)
                pcpu_schedule_balance_work();

        /* clear the areas and return address relative to base address */
