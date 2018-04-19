Content-Type: multipart/mixed; boundary="===============1958348260848070966=="
MIME-Version: 1.0
From: Dave Hansen <dave.hansen@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [do_execve] attempted to set unsupported pgprot
Date: Thu, 19 Apr 2018 14:26:15 -0700
Message-ID: <e8f57e63-2657-6193-55e0-b097363ec97a@linux.intel.com>
In-Reply-To: <20180418125916.a8be1fac1ac017f41a10f0fb@linux-foundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============1958348260848070966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 04/18/2018 12:59 PM, Andrew Morton wrote:
> Dave, fb43d6cb91ef57 ("x86/mm: Do not auto-massage page protections")
> looks like a culprit?

This looks like a problem when a 32-bit kernel runs on hardware without
NX support.  I'm digging into it but haven't found a root cause yet.

--===============1958348260848070966==--

