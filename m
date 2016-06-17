Content-Type: multipart/mixed; boundary="===============8519729458495026632=="
MIME-Version: 1.0
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: lkp@lists.01.org
Subject: Re: [drm] e28cd4d0a2: INFO: trying to register non-static key.
Date: Sat, 18 Jun 2016 00:44:19 +0200
Message-ID: <CAKMK7uFAp-gDzu8ccurnCpdhTyNw6oxCnCN07CPDYVEi6m67oA@mail.gmail.com>
In-Reply-To: <20160617221936.GA26365@nuc-i3427.alporthouse.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8519729458495026632==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 18, 2016 at 12:19 AM, Chris Wilson <chris@chris-wilson.co.uk>=
 wrote:
> On Sat, Jun 18, 2016 at 05:24:30AM +0800, kernel test robot wrote:
>>
>>
>> FYI, we noticed the following commit:
>>
>> git://anongit.freedesktop.org/drm-intel topic/drm-misc
>> commit e28cd4d0a223e1bcea616326e2281900e7e7e9a2 ("drm: Automatically reg=
ister/unregister all connectors")
>>
>>
>> on test machine: vm-lkp-wsx03-yocto-i386: 1 threads qemu-system-i386 -en=
able-kvm with 320M memory
>>
>> caused below changes:
>
> So one driver skips drm_mode_config_init() and so
> drm_connector_register_all() dies on the mutex_lock().
>
> Maybe
>
>         if (list_empty_safe(&dev->mode_config.connector_list))
>                 return;
>
> or we could add a boolean to indicate an active mode_config?

list_empty_safe seems to be the simplest solution, I'd go with that one.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch

--===============8519729458495026632==--

