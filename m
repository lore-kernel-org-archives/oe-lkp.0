Content-Type: multipart/mixed; boundary="===============8034333840182242366=="
MIME-Version: 1.0
From: Florian Fainelli <f.fainelli@gmail.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [net] 8e5bf9759a: WARNING:at_lib/refcount.c:#refcount_inc
Date: Thu, 09 Nov 2017 07:58:51 -0800
Message-ID: <317b76b0-cb7c-6609-7509-2345044c3651@gmail.com>
In-Reply-To: <871sl7bglr.fsf@weeman.i-did-not-set--mail-host-address--so-tickle-me>
List-Id: <oe-lkp.lists.linux.dev>

--===============8034333840182242366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 11/09/2017 07:45 AM, Vivien Didelot wrote:
> Hi,
> =

> Hum I don't understand why I don't see this 'increment on 0'
> warning... But I'm sending a fix for that anyway.

You need a platform which has FULL refcount support
(CONFIG_REFCOUNT_FULL), you are likely testing on ARM 32-bit which does
not currently have that. I would recommend firing up an x86_64 VM and
use that as a test platform to reproduce this.
-- =

Florian

--===============8034333840182242366==--

