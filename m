Content-Type: multipart/mixed; boundary="===============6470752841347205402=="
MIME-Version: 1.0
From: Pali Rohár <pali.rohar@gmail.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [platform/x86] bff589be59: kmsg.dell_wmi:Cannot_read_Dell_descriptor_buffer
Date: Thu, 20 Jul 2017 18:23:30 +0200
Message-ID: <20170720162330.GN16493@pali>
In-Reply-To: <20170720010220.GF27396@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6470752841347205402==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thursday 20 July 2017 09:02:20 kernel test robot wrote:
> commit: bff589be59c50924a9715951160578e570cba5c6 ("platform/x86: dell-wmi=
: Convert to the WMI bus infrastructure")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> [    7.104086] dell_wmi: Cannot read Dell descriptor buffer - 1

Hi Andy! Problem is in following code:

static int __init dell_wmi_init(void)
{
	int err;

	err =3D dell_wmi_check_descriptor_buffer();
	if (err)
		return err;

	dmi_check_system(dell_wmi_smbios_list);

	if (wmi_requires_smbios_request) {
		err =3D dell_wmi_events_set_enabled(true);
		if (err) {
			pr_err("Failed to enable WMI events\n");
			return err;
		}
	}

	return wmi_driver_register(&dell_wmi_driver);
}
module_init(dell_wmi_init);

static void __exit dell_wmi_exit(void)
{
	if (wmi_requires_smbios_request)
		dell_wmi_events_set_enabled(false);

	wmi_driver_unregister(&dell_wmi_driver);
}
module_exit(dell_wmi_exit);

dell_wmi_init and dell_wmi_exit should just call wmi_driver_register and
wmi_driver_unregister.

All those other calls (like different checks or enabling wmi events)
should be done in dell_wmi_probe from dell_wmi_driver structure. Same
for dell_wmi_remove.

Basically with this bus interface you should be able to load dell-wmi.ko
also on non-dell machines. Just bus code would not create and register
wmi device and so no probe would be called.

-- =

Pali Roh=C3=A1r
pali.rohar(a)gmail.com

--===============6470752841347205402==--

