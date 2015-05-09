Content-Type: multipart/mixed; boundary="===============3437076163939997197=="
MIME-Version: 1.0
From: Yu, Fenghua <fenghua.yu@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/xsaves] 4d90fc49c73: WARNING: CPU: 3 PID: 168 at arch/x86/kernel/xsave.c:306 save_xstate_sig+0x3a7/0x3d0()
Date: Sat, 09 May 2015 15:23:17 +0000
Message-ID: <3E5A0FA7E9CA944F9D5414FEC6C712205C8D76AB@ORSMSX106.amr.corp.intel.com>
In-Reply-To: <20150509125807.GE22912@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3437076163939997197==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> Here is another warning bisected to the same commit.
> =

> https://github.com/hansendc/linux.git github-mpx commit
> 4d90fc49c73730c09d7afd515f9c4e08d30229bd ("x86/xsaves: Define and use
> user_xstate_size for  xstate size in signal context")
> [    6.210858] WARNING: CPU: 3 PID: 168 at arch/x86/kernel/xsave.c:306
> save_xstate_sig+0x3a7/0x3d0()
> [    6.210860] mismatched xstate sizes

The issue has been fixed in https://lkml.org/lkml/2015/5/8/737

The patch in this git tree missed the following part when ported
to this git tree.

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


--===============3437076163939997197==--

