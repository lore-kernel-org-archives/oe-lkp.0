Content-Type: multipart/mixed; boundary="===============2354944755071755757=="
MIME-Version: 1.0
From: Yu, Fenghua <fenghua.yu@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/xsave] WARNING: CPU: 0 PID: 1 at arch/x86/kernel/xsave.c:306 save_xstate_sig()
Date: Sat, 09 May 2015 15:21:06 +0000
Message-ID: <3E5A0FA7E9CA944F9D5414FEC6C712205C8D769D@ORSMSX106.amr.corp.intel.com>
In-Reply-To: <20150509123108.GB22912@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2354944755071755757==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> From: Wu, Fengguang
> Sent: Saturday, May 09, 2015 5:31 AM
> To: Hansen, Dave
> Just in case this information will help: this patch adds one more warning
> message.
> =

> https://github.com/hansendc/linux.git github-mpx
> =

> commit 3701f7533ba43e0aec12bf2dffd49855499fa524
> [    3.058044] WARNING: CPU: 0 PID: 1 at arch/x86/kernel/xsave.c:306
> save_xstate_sig+0x329/0x340()
> [    3.059684] mismatched xstate sizes

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


--===============2354944755071755757==--

