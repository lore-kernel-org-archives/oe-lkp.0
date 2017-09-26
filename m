Content-Type: multipart/mixed; boundary="===============6680873762990471245=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86/apic] 935356cecd: ACPI_Error:Table[DMAR]is_not_invalidated_during_early_boot_stage(#/tbxface -#)
Date: Tue, 26 Sep 2017 18:06:18 +0200
Message-ID: <alpine.DEB.2.20.1709261805000.2884@nanos>
In-Reply-To: <20170926153540.jawqlavnnestyqap@inn>
List-Id: <oe-lkp.lists.linux.dev>

--===============6680873762990471245==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 26 Sep 2017, kernel test robot wrote:
> kern  :info  : [    0.036266] ACPI: Core revision 20170728
> kern  :err   : [    0.040010] ACPI Error: Table [DMAR] is not invalidated=
 during early boot stage (20170728/tbxface-196)

Looks like I missed the following patch:

http://lkml.kernel.org/r/1505294274-441-1-git-send-email-douly.fnst(a)cn.fu=
jitsu.com

I'll apply it once you confirm.

Thanks,

	tglx

--===============6680873762990471245==--

