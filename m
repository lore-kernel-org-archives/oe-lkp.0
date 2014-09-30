Content-Type: multipart/mixed; boundary="===============5066671084192472041=="
MIME-Version: 1.0
From: Paolo Bonzini <pbonzini@redhat.com>
To: lkp@lists.01.org
Subject: Re: [x86, kvm] WARNING: at arch/x86/kernel/pvclock.c:182 pvclock_init_vsyscall()
Date: Tue, 30 Sep 2014 14:05:09 +0200
Message-ID: <542A9C75.4000703@redhat.com>
In-Reply-To: <20140930075927.GC9561@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5066671084192472041==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Il 30/09/2014 09:59, Fengguang Wu ha scritto:
> +--------------------------------------------------------------+---------=
---+------------+------------+
> |                                                              | 71056ae2=
2d | 3dc4f7cfb7 | d778df51c0 |
> +--------------------------------------------------------------+---------=
---+------------+------------+
> | boot_successes                                               | 141     =
   | 0          | 0          |
> | boot_failures                                                | 0       =
   | 47         | 11         |
> | WARNING:at_arch/x86/kernel/pvclock.c:pvclock_init_vsyscall() | 0       =
   | 47         | 11         |
> | backtrace:pvclock_init_vsyscall                              | 0       =
   | 47         | 11         |
> | backtrace:warn_slowpath_null                                 | 0       =
   | 47         | 11         |
> | backtrace:kvm_setup_vsyscall_timeinfo                        | 0       =
   | 47         | 11         |
> | backtrace:kvm_guest_init                                     | 0       =
   | 47         | 11         |
> | Kernel_panic-not_syncing:Attempted_to_kill_init_exitcode=3D    | 0     =
     | 0          | 7          |
> | BUG:kernel_boot_hang                                         | 0       =
   | 0          | 4          |
> +--------------------------------------------------------------+---------=
---+------------+------------+

Can I get the randconfig that was used?

Paolo

--===============5066671084192472041==--

