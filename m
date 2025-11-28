Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21B43081DF
	for <oe-lkp@lists.linux.dev>; Fri, 28 Nov 2025 10:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764324725; cv=none; b=ZZtUVgqH3XwaIfwyw4j4aXZf4NghTLtVWVTbRUqOpId6MrffkH40M1BvZkiq75g6bQOfCiCbd9ABxijS+i7E4V6RU4IdHc8x5X3dzmmN4csOQuPrflpsuSo0eHya2bl1e81km97I/3FlpFTUHBxcnJ3csqQOVHTAW686HBL0OMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764324725; c=relaxed/simple;
	bh=scssQaCpvYB7CGUvvtSNOfY4nfHbDnuxAWsl0s5GacU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d6BUbM27aPS+eNf7Ug3gBv07IDvjxceyok2jTchBGlpbq05lRvamoAYM0Ojmhx+JS3fPhrLADIuTpNcBHGs9rPZ+1VQNij4xWgy+NduSb2FJaAHCzP7vIpWsIEm92d3CYgYXYVKQyJ1xUyoYVhxN7YyZFSE7WRpBnJvbjqtBWvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxEGygD9; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxEGygD9"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6418b55f86dso3059117a12.1
        for <oe-lkp@lists.linux.dev>; Fri, 28 Nov 2025 02:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764324720; x=1764929520; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7WsUZr2jMfjYJECVH2p53NXOUUeurhUorLcyCerESI=;
        b=BxEGygD9ArUeAsiZlSEDJ5z09DDS/tj0moZeD+d1oN8rwRuDseNY3k+mjoAc7Hj4R6
         vYBqjnN4XV5NTrKPtB8iYLV/PDYgEXErV4S8T8EjbeVIsZbq9q9ITjYz2TcMtUxJCkal
         nE3pWUCBCR3TXOtWAPCnDzWmygxW2wwcudZzcYJouI0EM1CGU14YXEny+O4CkpdFAzKc
         xkZZJGEg293x/lJdSP6mhR6ILI+CPzFI4nXH1JaTQuoOmrbNMyhyVQpyLL11yT3iDBiU
         DBmIAhiGbgw2icb2rBGvQ1TdFftZ8wxyuD+RdAj+UPC9ht5Y7l+ODjqvYgd9seWy736z
         rONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764324720; x=1764929520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O7WsUZr2jMfjYJECVH2p53NXOUUeurhUorLcyCerESI=;
        b=TDA8xH+fArgyXUYLANwW5pLny6Y9qQmpxnapBLjkdpBU/3WuaFsZ81uRvsbcfPIQMR
         UG26zq7FeJbR3LWbmdiX15q3KiQXxUuujPZJi/4KJ16yY9tDYyBWD/nNxxccBdFUtu9A
         WQyqNJzBwBS6SwYwcgtu0Q3L0q5b1lAYMIhUtA3tMlRIyVqhm75YayWXlosFNBdi5EbH
         ofTxkPohtdnnTMkh9WnU4wJ7zhIFcVwI7/uDnXRF8cavQ/jLac1Uvj9TZH4MtJc+BqjN
         xy9vJth1bq3uryF2EWQjWoQA0EgsQL/Sr+v9ZIPjWIco9Hbqr3ZY4s/9CAiGlPdSbUqR
         TTRA==
X-Forwarded-Encrypted: i=1; AJvYcCW2T3CQ6TwWNCDi14AD5fWlryad78mS0sql6lcc/Wl2k+34fvgQuEZnR1bo6+LcretZd6W/Fsg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzg/g21qyF6AeztrpH77UCnJiIihvZkTvAgbk1y0JB8CgSrNmuw
	pzH3kWr4BZAdaKaZqaaQPzjnvV+0KPF8ELJ2hy4vkBEr1faSU7thpJ84X+GUlOPSNyjM+dDl9xG
	DB7Nu/dWzyiGuWNyyynzZ92ycXFN7r6Q=
X-Gm-Gg: ASbGncscgCnPF6yGYt5Q9vDqJM/3j+HRPDQvAKMbm/OyL92/Y8Wxr/YkweQEwST0tqQ
	DD4+2PLrzSfMEJhJuWJCSvNymOb3PUjMqy6F8v/PxoMYcpa04l2RwgmdZqBiKXdLfg9cTWBo+z1
	ZvrHsNMUjxMkC9tj6m8oqaC4pyRJVIZUMMBdHyksmiFwPK0XELyGWjZuwYRrNN4JUzBYp3wucgI
	deKl8JGBj1ttkDqTuuPwTTJi0BQ8BJnPTcnzhRZVVcfn0cFI/wkDyEeG4wtJ9cxQwAVEhxvJ4OR
	bX5aT9DugRXE75UR7RejzyWMTQ==
X-Google-Smtp-Source: AGHT+IGYmn4DarAcLBe7K9O3HGnImurPCw43pht2NubEbtyhDBc1IbtS5JUGRc43oLmB1C2/RvNRNM9GE/rT3QH7neo=
X-Received: by 2002:a05:6402:24cc:b0:640:b814:bb81 with SMTP id
 4fb4d7f45d1cf-645546a3c11mr26097149a12.32.1764324719838; Fri, 28 Nov 2025
 02:11:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202511281306.51105b46-lkp@intel.com>
In-Reply-To: <202511281306.51105b46-lkp@intel.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Fri, 28 Nov 2025 11:11:46 +0100
X-Gm-Features: AWmQ_blfkl1xyCJVottvz1ROrDO0QFCQ0X_0lvUZa4vyxjnrFnc8c2btiH13Ykw
Message-ID: <CAGudoHFTikYFRoJu2mRhNFv6GHPP4LNEDetMdsqkzAg1nTJfRA@mail.gmail.com>
Subject: Re: [linus:master] [x86] 284922f4c5: stress-ng.sockfd.ops_per_sec
 6.1% improvement
To: kernel test robot <oliver.sang@intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2025 at 7:30=E2=80=AFAM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed a 6.1% improvement of stress-ng.sockfd.ops_per_=
sec on:
>
>
> commit: 284922f4c563aa3a8558a00f2a05722133237fe8 ("x86: uaccess: don't us=
e runtime-const rewriting in modules")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
>
> testcase: stress-ng
> config: x86_64-rhel-9.4
> compiler: gcc-14
> test machine: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (S=
apphire Rapids) with 256G memory
> parameters:
>
>         nr_threads: 100%
>         testtime: 60s
>         test: sockfd
>         cpufreq_governor: performance
>
>
>
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20251128/202511281306.51105b46-lk=
p@intel.com
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testc=
ase/testtime:
>   gcc-14/performance/x86_64-rhel-9.4/100%/debian-13-x86_64-20250902.cgz/l=
kp-spr-r02/sockfd/stress-ng/60s
>
> commit:
>   17d85f33a8 ("Merge tag 'for-linus' of git://git.kernel.org/pub/scm/linu=
x/kernel/git/rdma/rdma")
>   284922f4c5 ("x86: uaccess: don't use runtime-const rewriting in modules=
")
>
> 17d85f33a83b84e7 284922f4c563aa3a8558a00f2a0
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>   55674763            +6.1%   59075135        stress-ng.sockfd.ops
>     927326            +6.1%     983845        stress-ng.sockfd.ops_per_se=
c
>       3555 =C2=B1  3%     +10.6%       3932 =C2=B1  3%  perf-c2c.DRAM.rem=
ote
>       4834 =C2=B1  3%     +12.0%       5415 =C2=B1  3%  perf-c2c.HITM.loc=
al
>       2714 =C2=B1  2%     +12.5%       3054 =C2=B1  3%  perf-c2c.HITM.rem=
ote
>       0.51            +3.9%       0.53        perf-stat.i.MPKI
>   34903541            +5.2%   36715161        perf-stat.i.cache-misses
>  1.072e+08            +5.8%  1.133e+08        perf-stat.i.cache-reference=
s
>      18971            -5.5%      17932        perf-stat.i.cycles-between-=
cache-misses
>       0.46 =C2=B1 30%     +13.6%       0.52        perf-stat.overall.MPKI
>   31330827 =C2=B1 30%     +14.9%   36004895        perf-stat.ps.cache-mis=
ses
>   96530576 =C2=B1 30%     +15.3%  1.113e+08        perf-stat.ps.cache-ref=
erences
>      48.32            -0.2       48.16        perf-profile.calltrace.cycl=
es-pp._raw_spin_lock.unix_del_edges.unix_stream_read_generic.unix_stream_re=
cvmsg.sock_recvmsg
>      48.23            -0.2       48.07        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath._raw_spin_lock.unix_del_edges.unix_s=
tream_read_generic.unix_stream_recvmsg
>      48.34            -0.2       48.18        perf-profile.calltrace.cycl=
es-pp.unix_del_edges.unix_stream_read_generic.unix_stream_recvmsg.sock_recv=
msg.____sys_recvmsg
>       0.56 =C2=B1  4%      +0.1        0.65 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.__x64_sys_openat.do=
_syscall_64
>       0.62 =C2=B1  3%      +0.1        0.71 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL=
_64_after_hwframe.stress_sockfd
>       0.56 =C2=B1  3%      +0.1        0.65 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.do_filp_open.do_sys_openat2.__x64_sys_openat.do_syscall_64.=
entry_SYSCALL_64_after_hwframe
>      48.34            -0.2       48.18        perf-profile.children.cycle=
s-pp.unix_del_edges
>       0.15 =C2=B1  3%      +0.0        0.17 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__scm_recv_common
>       0.08 =C2=B1  7%      +0.0        0.10 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.lockref_put_return
>       0.09 =C2=B1  5%      +0.0        0.11 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__fput
>       0.35 =C2=B1  5%      +0.1        0.43 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.do_open
>       0.63 =C2=B1  3%      +0.1        0.72 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.do_sys_openat2
>       0.56 =C2=B1  3%      +0.1        0.65 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.do_filp_open
>

While this may read suspicious as the change is supposed to be a nop
for core kernel, it in fact is not as it adds:
/* Used for modules: built-in code uses runtime constants */
+unsigned long USER_PTR_MAX;
+EXPORT_SYMBOL(USER_PTR_MAX);

this should probably be __ro_after_init.

The test at hand is heavily bottlenecked on the global lock in the
garbage collector, which is not annotated with anything.

On my kernel I see this (nm vmlinux | sort -nk 1):
ffffffff846c0a20 b bsd_socket_locks
ffffffff846c0e20 b bsd_socket_buckets
ffffffff846c1620 b unix_nr_socks
ffffffff846c1628 b gc_in_progress
ffffffff846c1630 b unix_graph_cyclic_sccs
ffffffff846c1638 b unix_gc_lock <--- THE LOCK
ffffffff846c1640 b unix_vertex_unvisited_index
ffffffff846c1648 b unix_graph_state
ffffffff846c1660 b unix_stream_bpf_prot
ffffffff846c1820 b unix_stream_prot_lock
ffffffff846c1840 b unix_dgram_bpf_prot
ffffffff846c1a00 b unix_dgram_prot_lock

note how bsd_socket_buckets looks suspicious in its own right, but
ignoring that bit, I'm guessing things got pushed around and it
changed some of cacheline bouncing.

while a full fix is beyond the scope of this patch(tm), perhaps the
annotation below will stabilize it against random breakage. can you
guys bench it.

diff --git a/net/unix/garbage.c b/net/unix/garbage.c
index 78323d43e63e..25f65817faab 100644
--- a/net/unix/garbage.c
+++ b/net/unix/garbage.c
@@ -199,7 +199,7 @@ static void unix_free_vertices(struct scm_fp_list *fpl)
        }
 }

-static DEFINE_SPINLOCK(unix_gc_lock);
+static __cacheline_aligned_in_smp DEFINE_SPINLOCK(unix_gc_lock);

 void unix_add_edges(struct scm_fp_list *fpl, struct unix_sock *receiver)
 {
