Content-Type: multipart/mixed; boundary="===============0092029509368182595=="
MIME-Version: 1.0
From: Andrew Lunn <andrew@lunn.ch>
To: lkp@lists.01.org
Subject: Re: [PATCH net-next] net: dsa: remove tree refcount
Date: Thu, 09 Nov 2017 19:10:15 +0100
Message-ID: <20171109181015.GH13277@lunn.ch>
In-Reply-To: <20171109173652.25258-1-vivien.didelot@savoirfairelinux.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0092029509368182595==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 09, 2017 at 12:36:52PM -0500, Vivien Didelot wrote:
> Setting the refcount to 0 when allocating a tree to match the number of
> switch devices it holds may cause an 'increment on 0; use-after-free'.
> =

> Tracking the number of devices in a tree with a kref is not really
> appropriate anyway so removes it completely in favor of a basic counter.

Hi Vivien

How are you protecting this basic counter? switches can come and go at
random, modules are loaded and unloaded, probing can happen in
parallel, probes can fail with EPROBE_DEFFER causing a switch to
unregister itself while others are registering themselves, etc.

The point of using a kref is that it is a well known kernel method of
safely handling this situation. When the last member of the tree goes
away, we safely and atomically remove the tree. It worked well for a
few years, until you refactored it. Maybe the correct solution is to
revert your change?

      Andrew

--===============0092029509368182595==--

