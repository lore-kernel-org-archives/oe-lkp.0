Content-Type: multipart/mixed; boundary="===============7563554384070384366=="
MIME-Version: 1.0
From: Gabriel Krisman Bertazi <krisman@collabora.co.uk>
To: lkp@lists.01.org
Subject: Re: [drm] 4e64e5539d [ 1138.272031] NMI watchdog: BUG: soft lockup - CPU#0 stuck for 23s! [swapper:1]
Date: Wed, 29 Mar 2017 22:37:09 -0300
Message-ID: <87k277y27u.fsf@dilma.collabora.co.uk>
In-Reply-To: <20170329042937.ihpexoorzrnd3zqn@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7563554384070384366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fengguang Wu <fengguang.wu@intel.com> writes:

> Hi Chris,
>
>>+------------------------------------------+------------+------------+---=
--------+---------------+
>>|                                          | 17aad8a340 | 4e64e5539d | v4=
.11-rc3 | next-20170320 |
>>+------------------------------------------+------------+------------+---=
--------+---------------+
>>| boot_successes                           | 0          | 0          | 0 =
        | 0             |
>>| boot_failures                            | 1220       | 312        | 32=
4       | 63            |
>>| BUG:unable_to_handle_kernel              | 1220       | 312        | 32=
4       | 63            |
>>| Oops:#[##]                               | 1220       | 312        | 32=
4       | 63            |
>>| Kernel_panic-not_syncing:Fatal_exception | 1220       | 312        | 32=
4       | 63            |
>>+------------------------------------------+------------+------------+---=
--------+---------------+
>>
>>[  195.344608] [TTM] Zone  kernel: Available graphics memory: 200980 kiB
>>[  195.345639] [TTM] Initializing pool allocator
>>[  195.346363] [TTM] Initializing DMA pool allocator
>>[  195.347754] [drm] Initialized bochs-drm 1.0.0 20130925 for 0000:00:02.=
0 on minor 0
>>[  195.349292] irq event stamp: 5513
>>[  195.349293] BUG: unable to handle kernel NULL pointer dereference at 0=
000000000000620
>>[  195.349309] IP: __lock_acquire+0xc8/0xfe6
>
>
> Sorry that looks like an old bug. While the below soft lockup
> call trace looks more related to the code change.
>

Hi,

For the record, I suspect the Null pointer dereference is already fixed in =
the tip
of drm-misc-next.  See 4fa13dbe8c86 ("drm: bochs: Don't remove uninitialize=
d fbdev framebuffer").

-- =

Gabriel Krisman Bertazi

--===============7563554384070384366==--

