Content-Type: multipart/mixed; boundary="===============7319970789210031898=="
MIME-Version: 1.0
From: Yu, Fenghua <fenghua.yu@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/xsaves] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000b00
Date: Sat, 09 May 2015 15:26:21 +0000
Message-ID: <3E5A0FA7E9CA944F9D5414FEC6C712205C8D76B9@ORSMSX106.amr.corp.intel.com>
In-Reply-To: <20150509122916.GA22912@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7319970789210031898==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> From: Wu, Fengguang
> Sent: Saturday, May 09, 2015 5:29 AM
> To: Hansen, Dave
> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://github.com/hansendc/linux.git github-mpx
> =

> commit 4d90fc49c73730c09d7afd515f9c4e08d30229bd
> [    1.096425] Kernel panic - not syncing: Attempted to kill init!
> exitcode=3D0x00000b00 =


The issue has already been fixed in https://lkml.org/lkml/2015/5/8/737

The patch in this git tree missed the following part when ported
to this git tree. It's the same mistake as the other two warnings
generated from the same commit.

diff --git a/arch/x86/kernel/i387.c b/arch/x86/kernel/i387.c
index 00918327..8a7b96b 100644
--- a/arch/x86/kernel/i387.c
+++ b/arch/x86/kernel/i387.c
@@ -166,6 +166,7 @@ static void init_thread_xstate(void)
 		setup_clear_cpu_cap(X86_FEATURE_XSAVE);
 		setup_clear_cpu_cap(X86_FEATURE_XSAVEOPT);
 		xstate_size =3D sizeof(struct i387_soft_struct);
+		user_xstate_size =3D xstate_size;
 		return;
 	}
 =

@@ -173,6 +174,8 @@ static void init_thread_xstate(void)
 		xstate_size =3D sizeof(struct i387_fxsave_struct);
 	else
 		xstate_size =3D sizeof(struct i387_fsave_struct);
+
+	user_xstate_size =3D xstate_size;
 }
 =

 /*

Thanks.

-Fenghua


--===============7319970789210031898==--

