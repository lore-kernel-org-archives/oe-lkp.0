Content-Type: multipart/mixed; boundary="===============7597604063709031404=="
MIME-Version: 1.0
From: riku.voipio@linaro.org
To: lkp@lists.01.org
Subject: [PATCH] job2sh: check only end of path
Date: Mon, 08 Jun 2015 14:23:37 +0300
Message-ID: <1433762617-21273-1-git-send-email-riku.voipio@linaro.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============7597604063709031404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Riku Voipio <riku.voipio@linaro.org>

Under lava, tests are run at /lava-arndale04/tests/foo/.../ path,
which makes job2sh make wrapper. Check only last part of path
binary. The exception left is monitors/ , where some monitors are
under deeper path ( monitors/event/wakeup ).

Note this is the first time I touch ruby code so feel free to
fixup if there is some errors.

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 lib/job2sh.rb | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/lib/job2sh.rb b/lib/job2sh.rb
index 2927ab5..b1d6a90 100755
--- a/lib/job2sh.rb
+++ b/lib/job2sh.rb
@@ -92,25 +92,25 @@ def create_cmd(program, args)
 	program_path =3D $programs[program] || program
 =

 	args =3D [] if program_path.index('/stats/')
-
-	wrapper =3D File.dirname(program_path) + '/wrapper'
+	program_dir =3D File.dirname(program_path)
+	wrapper =3D program_dir + '/wrapper'
 	if File.executable?(wrapper)
 		cmd =3D [ wrapper, program, *args ]
 	else
 		cmd =3D [ program_path, *args ]
 	end
 =

-	case program_path
-	when %r{/monitors/}
+	case program_dir
+	when %r{/monitors}
 		cmd =3D [ "run_monitor", *cmd ]
 		exec_line unless $script_lines[-1] =3D~ /run_monitor/
-	when %r{/setup/}
+	when %r{/setup$}
 		cmd =3D [ "run_setup", *cmd ]
 		exec_line
-	when %r{/daemon/}
+	when %r{/daemon$}
 		cmd =3D [ "start_daemon", *cmd ]
 		exec_line
-	when %r{/tests/}
+	when %r{/tests$}
 		cmd =3D [ "run_test", *cmd ]
 		exec_line
 		$stats_lines << "\t$LKP_SRC/stats/wrapper time #{program}.time"
-- =

2.1.4


--===============7597604063709031404==--

