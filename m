Content-Type: multipart/mixed; boundary="===============7156728251952839694=="
MIME-Version: 1.0
From: Thomas Graf <tgraf@suug.ch>
To: lkp@lists.01.org
Subject: Re: Fwd: [rhashtable] WARNING: CPU: 0 PID: 10 at kernel/locking/mutex.c:570 mutex_lock_nested()
Date: Mon, 12 Jan 2015 12:42:16 +0000
Message-ID: <20150112124216.GA26570@casper.infradead.org>
In-Reply-To: <54B3259B.7080601@windriver.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7156728251952839694==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 01/12/15 at 09:38am, Ying Xue wrote:
> Hi Thomas,
> =

> I am really unable to see where is wrong leading to below warning
> complaints. Can you please help me check it?

Not sure yet. It's not your patch that introduced the issue though.
It merely exposed the affected code path.

Just wondering, did you test with CONFIG_DEBUG_MUTEXES enabled?

--===============7156728251952839694==--

