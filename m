Content-Type: multipart/mixed; boundary="===============3996541539795456835=="
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
To: lkp@lists.01.org
Subject: Re: [drm] e28cd4d0a2: INFO: trying to register non-static key.
Date: Fri, 17 Jun 2016 23:19:36 +0100
Message-ID: <20160617221936.GA26365@nuc-i3427.alporthouse.com>
In-Reply-To: <57646a8e.UuDC1oOY1mGMRtHR%xiaolong.ye@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3996541539795456835==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 18, 2016 at 05:24:30AM +0800, kernel test robot wrote:
> =

> =

> FYI, we noticed the following commit:
> =

> git://anongit.freedesktop.org/drm-intel topic/drm-misc
> commit e28cd4d0a223e1bcea616326e2281900e7e7e9a2 ("drm: Automatically regi=
ster/unregister all connectors")
> =

> =

> on test machine: vm-lkp-wsx03-yocto-i386: 1 threads qemu-system-i386 -ena=
ble-kvm with 320M memory
> =

> caused below changes:

So one driver skips drm_mode_config_init() and so
drm_connector_register_all() dies on the mutex_lock().

Maybe

	if (list_empty_safe(&dev->mode_config.connector_list))
		return;

or we could add a boolean to indicate an active mode_config?
-Chris

-- =

Chris Wilson, Intel Open Source Technology Centre

--===============3996541539795456835==--

