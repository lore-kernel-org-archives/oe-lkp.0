Content-Type: multipart/mixed; boundary="===============4374866166662184503=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] workqueue: Remove the warning in wq_worker_sleeping()
Date: Fri, 03 Apr 2020 20:25:02 +0200
Message-ID: <20200403182502.woqrxpydt3n6l6ie@linutronix.de>
In-Reply-To: <20200403174500.75rwuijdri5ewl5c@ca-dmjordan1.us.oracle.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4374866166662184503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2020-04-03 13:45:00 [-0400], Daniel Jordan wrote:
> Why would preemption prevent it?  Interrupts are still enabled.
> =

> What am I missing?  :-)

Preemption is disabled which means no other task is allowed to be
scheduled.

Sebastian
--===============4374866166662184503==--

