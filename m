Content-Type: multipart/mixed; boundary="===============2104180981427980622=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [perf/x86] 8de4a00661: WARNING: CPU: 0 PID: 1 at kernel/locking/mutex-debug.c:80 debug_mutex_unlock+0x20c/0x2b3
Date: Tue, 12 Jul 2016 18:41:29 +0200
Message-ID: <alpine.DEB.2.11.1607121839390.4083@nanos>
In-Reply-To: <57851c63.jJgXfR29tgQSoJ3w%xiaolong.ye@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2104180981427980622==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Jul 2016, kernel test robot wrote:
> [    1.863354] WARNING: CPU: 0 PID: 1 at kernel/locking/mutex-debug.c:80 =
debug_mutex_unlock+0x20c/0x2b3
> [    1.877193] DEBUG_LOCKS_WARN_ON(lock->owner !=3D current)
> =

> [    1.979431]  [<ffffffff8167508c>] mutex_unlock+0x9/0xb
> [    1.979431]  [<ffffffff8167508c>] mutex_unlock+0x9/0xb
> [    1.990691]  [<ffffffff8105a67f>] cpuhp_store_callbacks+0x5a/0x63

I have a hard time to figure out how that can happen:

static void cpuhp_store_callbacks(enum cpuhp_state state,
                                  const char *name,
                                  int (*startup)(unsigned int cpu),
                                  int (*teardown)(unsigned int cpu))
{
        /* (Un)Install the callbacks for further cpu hotplug operations */
        struct cpuhp_step *sp;

        mutex_lock(&cpuhp_state_mutex);
 	sp =3D cpuhp_get_step(state);
	sp->startup =3D startup;
        sp->teardown =3D teardown;
        sp->name =3D name;
        mutex_unlock(&cpuhp_state_mutex);
}

Confused ....


--===============2104180981427980622==--

