Content-Type: multipart/mixed; boundary="===============3441764954470837331=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [debug] 19d436268d: BUG:unable_to_handle_kernel
Date: Thu, 06 Apr 2017 13:47:26 +0200
Message-ID: <20170406114726.qnljok4vdfjgabno@hirez.programming.kicks-ass.net>
In-Reply-To: <20170406025014.GM17682@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============3441764954470837331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 06, 2017 at 10:50:14AM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: 19d436268dde95389c616bb3819da73f0a8b28a8 ("debug: Add _ONCE() log=
ic to report_bug()")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =


next/master doesn't build for me at all with your .config.

I get a metric ton of:

  MODPOST 893 modules
  LZ4     arch/x86/boot/compressed/vmlinux.bin.lz4
ERROR: "user_describe" [security/keys/trusted.ko] undefined!
ERROR: "__gcov_merge_add" [security/keys/trusted.ko] undefined!
ERROR: "__gcov_init" [security/keys/trusted.ko] undefined!
ERROR: "unregister_key_type" [security/keys/trusted.ko] undefined!
ERROR: "register_key_type" [security/keys/trusted.ko] undefined!
ERROR: "crypto_alloc_shash" [security/keys/trusted.ko] undefined!
ERROR: "tpm_seal_trusted" [security/keys/trusted.ko] undefined!
ERROR: "tpm_unseal_trusted" [security/keys/trusted.ko] undefined!
ERROR: "call_rcu" [security/keys/trusted.ko] undefined!
ERROR: "crypto_shash_digest" [security/keys/trusted.ko] undefined!

$ grep -c ERROR build.log
27293

--===============3441764954470837331==--

